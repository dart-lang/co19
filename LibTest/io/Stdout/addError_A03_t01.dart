/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * void addError(error, [StackTrace stackTrace])
 * This operation is non-blocking.
 * @description Checks that [addError] is non-blocking operation
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process(IOSink sink) {
  sink.addError("Error 1");
  sink.addError("Error 2");
  sink.addError("Error 3");
}

run_main(String mode) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, mode]).then((ProcessResult results) {
    Expect.isTrue(results.stderr.contains("Error 1"));
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
