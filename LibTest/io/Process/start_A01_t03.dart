/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<Process> start(
 *     String executable,
 *     List<String> arguments, {
 *     String workingDirectory,
 *     Map<String, String> environment,
 *     bool includeParentEnvironment: true,
 *     bool runInShell: false,
 *     ProcessStartMode mode: ProcessStartMode.NORMAL
 * })
 *
 * Starts a process running the executable with the specified arguments.
 * Returns a Future<Process> that completes with a Process instance when the
 * process has been successfully started. That Process object can be used to
 * interact with the process. If the process cannot be started the returned
 * Future completes with an exception.
 *
 * @description Checks that if the process cannot be started the returned
 * Future completes with an exception.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

String command;
List<String> args;

void setCommand() {
  if (Platform.isLinux) {
    command = 'abc';
    args = [];
  }
  if (Platform.isWindows) {
    command = 'abc';
    args = [];
  }
}

main() {
  bool pFailed = false;
  setCommand();
  Future<Process> eProcess = Process.start(command, args);
  eProcess.catchError((onError) {
    Expect.isTrue(onError is Exception);
    pFailed = true;
  }).then((process) {
    Expect.isTrue(pFailed);
  });
}
