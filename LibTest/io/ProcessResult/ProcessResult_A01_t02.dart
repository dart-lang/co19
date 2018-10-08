/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ProcessResult(int pid, int exitCode, stdout, stderr)
 *
 * @description Checks that if constructor [ProcessResult] creates a new object
 * of type ProcessResult with the same parameters as ProcessResult received
 * after completion Process.rum method, this two objects are not equal.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

String command;
List<String> args;

void setCommand() {
  command = 'dart';
  args = ['--version'];
}

main() {
  setCommand();
  Future<ProcessResult> processResult = Process.run(command, args);
  processResult.then((result) {
    ProcessResult pr = new ProcessResult(
        result.pid, result.exitCode, result.stdout, result.stderr);
    Expect.isFalse(processResult == pr);
  });
}
