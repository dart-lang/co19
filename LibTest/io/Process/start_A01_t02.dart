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
 * @description Checks that static method [start] starts a process running the
 * executable with the specified arguments. Returns a Future<Process> that
 * completes with a Process instance when the process has been successfully
 * started. Check running dart test that finished with error.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  String file = eScript.substring(7);
  int index = file.indexOf("start_A01_t02.dart");
  String ePath = file.substring(0, index);
  String eFile = ePath + "start_A01_t02_lib.dart";

  Future<Process> eProcess = Process.start(executable, [eFile]);
  eProcess.then((process) {
    Future<List<List<int>>> outList = process.stdout.toList();
    outList.then((List outList) {
      Expect.equals(0, outList.length);
    });
    Future<List<List<int>>> errList = process.stderr.toList();
    errList.then((List errList) {
      Utf8Decoder decode = new Utf8Decoder();
      String decoded = decode.convert(errList[0]);
      Expect.isTrue(decoded.contains("Unable to find 'main'"));
    });
  });
}
