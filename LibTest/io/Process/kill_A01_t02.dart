// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool kill([ProcessSignal signal = ProcessSignal.sigterm ])
///
/// Kills the process.
///
/// Where possible, sends the signal to the process. This includes Linux and
/// OS X. The default signal is ProcessSignal.sigterm which will normally
/// terminate the process.
///
/// On platforms without signal support, including Windows, the call just
/// terminates the process in a platform specific way, and the signal parameter
/// is ignored.
///
/// Returns true if the signal is successfully delivered to the process.
/// Otherwise the signal could not be sent, usually meaning that the process is
/// already dead.
///
/// @description Checks that method [kill] doesn't kill the process if this
/// process is successfully completed. The [exitCode] returns a Future which
/// completes with the exit code 0 when the process completes.
/// @author ngl@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  String command = Platform.resolvedExecutable;
  List<String> args = [...Platform.executableArguments, '--version'];
  asyncStart();
  Process.start(command, args).then((Process process) {
    process.exitCode.then((int value) {
      bool pKill = process.kill();
      Expect.isFalse(pKill);
      Expect.equals(0, value);
      asyncEnd();
    });
  });
}
