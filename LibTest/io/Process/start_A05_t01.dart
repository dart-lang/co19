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
 *     ProcessStartMode mode: ProcessStartMode.normal
 * })
 *
 * If mode is ProcessStartMode.DETACHED a detached process will be created. A
 * detached process has no connection to its parent, and can keep running on its
 * own when the parent dies. The only information available from a detached
 * process is its pid. There is no connection to its stdin, stdout or stderr,
 * nor will the process' exit code become available when it terminates.
 *
 * @description Checks that if mode is ProcessStartMode.DETACHED a detached
 * process will be created. The only information available from a detached
 * process is its pid. There is no connection to its stdin, stdout or stderr,
 * nor will the process' exit code become available when it terminates.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

String command = "";
List<String> args = new List<String>();

void setCommand() {
  if (Platform.isWindows) {
    command = Platform.resolvedExecutable;
    args = ['--version'];
  } else {
    command = 'pwd';
    args = [];
  }
}

main() {
  setCommand();
  Process
      .start(command, args, mode: ProcessStartMode.detached)
      .then((Process process) {
    Expect.isTrue(process.pid is int);
    Expect.throws(() {process.stdout;}, (e) => e is StateError);
    Expect.throws(() {process.stderr;}, (e) => e is StateError);
    Expect.throws(() {process.stdin;}, (e) => e is StateError);
    Expect.throws(() {process.exitCode;}, (e) => e is StateError);
  });
}
