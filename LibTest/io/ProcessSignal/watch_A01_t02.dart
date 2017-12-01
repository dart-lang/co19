/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<ProcessSignal> watch()
 * Watch for process signals.
 * The following ProcessSignals can be listened to:
 * - ProcessSignal.SIGHUP.
 * - ProcessSignal.SIGINT. Signal sent by e.g. CTRL-C.
 * - ProcessSignal.SIGTERM. Not available on Windows.
 * - ProcessSignal.SIGUSR1. Not available on Windows.
 * - ProcessSignal.SIGUSR2. Not available on Windows.
 * - ProcessSignal.SIGWINCH. Not available on Windows.
 *
 * Other signals are disallowed, as they may be used by the VM.
 *
 * A signal can be watched multiple times, from multiple isolates, where all
 * callbacks are invoked when signaled, in no specific order.
 *
 * @description Checks that mention ProcessSignals can be listened.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(ProcessSignal signal, int ec) {
  asyncStart();
  Process.start(Platform.executable, [
    Platform.script.resolve('watch_A01_t02_lib.dart').toFilePath(),
    signal.toString()
  ]).then((process) {
    process.stdin.close();
    process.stderr.drain();
    int dokill = 0;
    process.stdout.listen((out) {
      if (dokill < 2 ) {
        process.kill(signal);
        dokill++;
      }
    });
    process.exitCode.then((exitCode) {
      Expect.equals(ec, exitCode);
      asyncEnd();
    });
  });
}

main() {
  if (!Platform.isWindows) {
    check(ProcessSignal.SIGHUP, -1);
    check(ProcessSignal.SIGINT, -2);
    check(ProcessSignal.SIGTERM, -15);
    check(ProcessSignal.SIGUSR1, -10);
    check(ProcessSignal.SIGUSR2, -12);
    // ProcessSignal.SIGWINCH does not kill process
    check(ProcessSignal.SIGWINCH, 0);
  }
}
