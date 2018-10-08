/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic stderr
 *
 * Standard error from the process. The value used for the stderrEncoding
 * argument to Process.run determines the type. If null was used this value is
 * of type List<int> otherwise it is of type String.
 *
 * @description Checks that if constructor [ProcessResult] creates a new object
 * of type ProcessResult with same parameters as ProcessResult received after
 * completion Process.run method and stderrEncoding was null for completed
 * Process.run method, the [stderr] returns List<int> value.
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
      Process.run(command, args, stderrEncoding: null);
  fProcessResult.then((ProcessResult result) {
    dynamic stdErr = result.stderr;
    ProcessResult pr = new ProcessResult(
        result.pid, result.exitCode, result.stdout, result.stderr);
    Expect.isTrue(pr.stderr is List<int>);
    Expect.isTrue(pr.stderr == stdErr);
  });
}
