/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int pid
 *
 * Process id of the process.
 *
 * @description Checks that [pid] of a new ProcessResult object created with the
 * same parameters as ProcessResult received after completion Process.run
 * method, is equal to pid of ProcessResult of completed Process.run.
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
  Future<ProcessResult> fProcessResult = Process.run(command, args);
  fProcessResult.then((ProcessResult result) {
    dynamic pId = result.pid;
    ProcessResult pr = new ProcessResult(
        result.pid, result.exitCode, result.stdout, result.stderr);
    Expect.isTrue(pr.pid == pId);
  });
}
