// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion void writeAll(Iterable objects, [String separator = ""])
/// Iterates over the given [objects] and writes them in sequence.
/// @description Check that all the objects are written in the result stream.
/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";
import "dart:io";

class ObjectToPass {
  String toString() {
    return "I am here";
  }
}

List objects = [
  "Testme",
  123,
  new ObjectToPass(),
  new StackTrace.fromString("Stack trace"),
  [1, 2, 3],
  null
];

String expected = "Testme123I am hereStack trace[1, 2, 3]null";

run_process(IOSink sink) {
  sink.writeAll(objects);
}

run_main(String mode) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(
          executable, [...Platform.executableArguments, eScript, mode])
      .then((ProcessResult results) {
    Expect.equals(expected, mode == "err" ? results.stderr : results.stdout);
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  if (args.length > 0)
    run_process(args[0] == "err" ? stderr : stdout);
  else {
    run_main("out");
    run_main("err");
  }
}
