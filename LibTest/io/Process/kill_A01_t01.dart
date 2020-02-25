/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool kill([ProcessSignal signal = ProcessSignal.sigterm ])
 *
 * Kills the process.
 *
 * Where possible, sends the signal to the process. This includes Linux and
 * OS X. The default signal is ProcessSignal.sigterm which will normally
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
 * @description Checks that method [kill] kills the process and [exitCode]
 * returns a Future which completes with the exit code of the process when the
 * process completes. On Linux and OS X if the process was terminated due to a
 * signal  the exit code will be a negative value in the range -255..-1, where
 * the absolute value of the exit code is the signal number. If the process is
 * killed with ProcessSignal.sigterm the exit code is -15, as the signal SIGTERM
 * has number 15.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

String command = "";
List<String> args = new List<String>();

void setCommand() {
  if (Platform.isWindows) {
    command = 'ping';
    args = ['127.0.0.1 -n 6 > nul'];
  } else {
    command = 'sleep';
    args = ['5'];
  }
}

main() {
  setCommand();
  asyncStart();
  Process.start(command, args).then((Process process) {
    bool pKill = process.kill();
    if (!Platform.isWindows) {
      Expect.isTrue(pKill);
    }

    process.exitCode.then((int value) {
      if (Platform.isLinux || Platform.isMacOS) {
        Expect.equals(-15, value);
      } else if (Platform.isWindows) {
        Expect.equals(1, value);
      }
      pKill = process.kill(ProcessSignal.sigterm);
      Expect.isFalse(pKill);
      asyncEnd();
    });
  });
}
