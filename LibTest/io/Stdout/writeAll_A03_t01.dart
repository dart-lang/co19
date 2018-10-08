/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAll(Iterable objects, [String separator = ""])
 * This operation is non-blocking.
 * @description Check that [writeAll] is non-blocking operation.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

class ObjectToPass {
  String toString() { return "I am here"; }
}

List objects1 = [
  "Testme",
  123,
  new ObjectToPass()];
List objects2 = [
  new StackTrace.fromString("Stack trace"),
  [1, 2, 3],
  null];
List objects3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];


String expected = "Testme123I am hereStack trace[1, 2, 3]null1234567890";

run_process(IOSink sink) {
  sink.writeAll(objects1);
  sink.writeAll(objects2);
  sink.writeAll(objects3);
}

run_main(String mode) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, mode]).then((ProcessResult results) {
    Expect.equals(expected, mode == "err" ? results.stderr : results.stdout);
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  if(args.length > 0)
    run_process(args[0] == "err" ? stderr : stdout);
  else {
    run_main("out");
    run_main("err");
  }
}
