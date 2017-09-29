/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool kill([ProcessSignal signal = ProcessSignal.SIGTERM ])
 *
 * Kills the process.
 *
 * Where possible, sends the signal to the process. This includes Linux and
 * OS X. The default signal is ProcessSignal.SIGTERM which will normally
 * terminate the process.
 *
 * On platforms without signal support, including Windows, the call just
 * terminates the process in a platform specific way, and the signal parameter
 * is ignored.
 *
 * Returns true if the signal is successfully delivered to the process.
 * Otherwise the signal could not be sent, usually meaning that the process is
 * already dead.
 *
 * @description Checks that method [kill] doesn't kill the process if this
 * process is successfully completed. The [exitCode] returns a Future which
 * completes with the exit code 0 when the process completes.
 * @author ngl@unipro.ru
 */
import "dart:async";
import 'dart:convert';
import "dart:io";
import "../../../Utils/expect.dart";

String command;
List<String> args;

void setCommand() {
  if (Platform.isLinux) {
    command = 'echo';
    args = ['-start'];
  }
  if (Platform.isWindows) {
    command = 'echo';
    args = ['abc'];
  }
}

main() {
  setCommand();
  Process.start(command, args).then((Process process) {
    bool pKill = process.kill();
    Expect.isFalse(pKill);

    Expect.isTrue(process.exitCode is Future<int>);
    Future<int> eCode = process.exitCode;
    eCode.then((value) {
      Expect.isTrue(value is int);
      if (Platform.isLinux) {
        Expect.isTrue(value == 0);
      }
    });

    Future<List<List<int>>> outList = process.stdout.toList();
    outList.then((List outList) {
      Utf8Decoder decode = new Utf8Decoder();
      String decoded = decode.convert(outList[0]);
      Expect.isTrue(decoded.contains("-start"));
    });

    Future<List<List<int>>> errList = process.stderr.toList();
    errList.then((List errList) {
      Expect.equals(0, errList.length);
    });
  });
}
