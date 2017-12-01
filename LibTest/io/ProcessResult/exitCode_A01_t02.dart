/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int exitCode
 *
 * Exit code for the process.
 *
 * @description Checks that if constructor ProcessResult creates a new object
 * with the same parameters as ProcessResult received after completion
 * Process.run method, [exitCode] of new object returns int value not equal 0
 * when the process was not completed successfully.
 *
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

String command;
List<String> args;

void setCommand() {
  command = 'dart';
  args = ["-l"];
}

main() {
  setCommand();
  Future<ProcessResult> fProcessResult = Process.run(command, args);
  fProcessResult.then((ProcessResult result) {
    ProcessResult pr = new ProcessResult(
        result.pid, result.exitCode, result.stdout, result.stderr);
    Expect.isFalse(pr.exitCode == 0);
  });
}
