/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IOSink nonBlocking
 * Get a non-blocking [IOSink].
 * @description Checks that output is never blocked for [nonBlocking] both for
 * stderr and stdout.
 * @author iarkh@unipro.ru
 */

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

Stream<List> aStream = new Stream<List>.fromIterable(
    [[1, 2, 3]]);
List<int> expected = [84, 101, 115, 116, 1, 2, 3];
bool called = false;

run_process(Stdout sink) {
  sink.nonBlocking.addStream(aStream).then((x) {
    new Future.delayed(new Duration(seconds: 3)).then((_) {});
  });
  sink.write("Test");
}

run_main(String mode) async {
  called = false;
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  await Process.run(executable, [eScript, mode]).then((ProcessResult results) {
    List<int> result =
        (mode == "err" ? results.stderr : results.stdout).codeUnits;
    Expect.equals(expected.length, result.length);
    expected.forEach((entity) {
      Expect.isTrue(result.contains(entity));
    });
    called = true;
  });
  Expect.isTrue(called);
}

main(List<String> args) async {
  if (args.length > 0 && args[0] == "err")
    run_process(stderr);
  else if (args.length > 0 && args[0] == "out")
    run_process(stdout);
  else {
    run_main("err");
    run_main("out");
  }
}
