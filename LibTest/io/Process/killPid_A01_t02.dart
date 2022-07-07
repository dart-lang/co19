// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// bool killPid(
///     int pid, [
///     ProcessSignal signal = ProcessSignal.sigterm
/// ])
///
/// Kills the process with id pid.
/// Where possible, sends the signal to the process with id pid. This includes
/// Linux and OS X. The default signal is ProcessSignal.sigterm which will
/// normally terminate the process.
/// On platforms without signal support, including Windows, the call just
/// terminates the process with id pid in a platform specific way, and the
/// signal parameter is ignored.
/// Returns true if the signal is successfully delivered to the process.
/// Otherwise the signal could not be sent, usually meaning that the process is
/// already dead.
///
/// @description Checks that static method [killPid] return false, if the
/// process is already dead.
/// @author ngl@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

String command = "";
List<String> args = new List<String>.empty(growable: true);

void setCommand() {
  if (Platform.isWindows) {
    command = 'timeout';
    args = ['10'];
  } else {
    command = 'sleep';
    args = ['5'];
  }
}

main() {
  setCommand();
  asyncStart();
  Process.start(command, args).then((Process process) {
    int pid = process.pid;
    bool res = Process.killPid(pid);
    if (Platform.isWindows) {
      if (res) {
        bool res2 = Process.killPid(pid);
        Expect.isFalse(res2);
        asyncEnd();
      }
    } else {
      Expect.isTrue(res);
      process.exitCode.then((value) {
        if (value == -15) {
          res = Process.killPid(pid);
          Expect.isFalse(res);
          asyncEnd();
        }
      });
    }
  });
}
