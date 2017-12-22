/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * void addError(error, [StackTrace stackTrace])
 * Passes the [error] to the target consumer as an error event.
 * @description Checks that it's impossible to write to [Stdout] after the error
 * appeared.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process(IOSink sink) {
  sink.addError("added error");
  sink.write("Should not be added");
 }

run_main(String mode) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, mode]).then((ProcessResult results) {
    Expect.isTrue(results.stderr.contains("added error"));
    Expect.isFalse(results.stderr.contains("Should not be added"));
    Expect.equals(0, results.stdout.length);
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
