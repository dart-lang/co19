/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> exitCode
 *
 * Returns a Future which completes with the exit code of the process when the
 * process completes.
 *
 * The handling of exit codes is platform specific.
 *
 * On Linux and OS X a normal exit code will be a positive value in the range
 * 0..255. If the process was terminated due to a signal the exit code will be
 * a negative value in the range -255..-1, where the absolute value of the exit
 * code is the signal number. For example, if a process crashes due to a
 * segmentation violation the exit code will be -11, as the signal SIGSEGV has
 * the number 11.
 *
 * On Windows a process can report any 32-bit value as an exit code. When
 * returning the exit code this exit code is turned into a signed value. Some
 * special values are used to report termination due to some system event. E.g.
 * if a process crashes due to an access violation the 32-bit exit code is
 * 0xc0000005, which will be returned as the negative number -1073741819. To get
 * the original 32-bit value use (0x100000000 + exitCode) & 0xffffffff.
 *
 * @description Checks that [exitCode] returns a Future which completes with the
 * exit code of the process when the process completes. On Linux and OS X if the
 * process was terminated due to a signal the exit code will be a negative value
 * in the range -255..-1, where the absolute value of the exit code is the
 * signal number. If the process is killed with ProcessSignal.sigterm the exit
 * code is -15, as the signal SIGTERM has number 15.
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
    process.kill(ProcessSignal.sigterm);

    process.exitCode.then((int value) {
      if (Platform.isWindows) {
        Expect.equals(1, value);
      } else if (Platform.isLinux || Platform.isMacOS) {
        Expect.equals(-15, value);
      }
      asyncEnd();
    });
  });
}
