/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic stdout
 *
 * Standard output from the process. The value used for the stdoutEncoding
 * argument to Process.run determines the type. If null was used this value is
 * of type List<int> otherwise it is of type String.
 *
 * @description Checks that if constructor [ProcessResult] creates a new object
 * of type ProcessResult with same parameters as ProcessResult received after
 * completion of Process.run method and stdoutEncoding was null for completed
 * Process.run method, the [stdout] returns List<int> value.
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
  Future<ProcessResult> fProcessResult =
      Process.run(command, args, stdoutEncoding: null);
  fProcessResult.then((ProcessResult result) {
    dynamic stdOut = result.stdout;
    ProcessResult pr = new ProcessResult(
        result.pid, result.exitCode, result.stdout, result.stderr);
    Expect.isTrue(pr.stdout is List<int>);
    Expect.isTrue(pr.stdout == stdOut);
  });
}
