/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<ProcessSignal> watch()
 * Watch for process signals.
 * The following ProcessSignals can be listened to:
 * - ProcessSignal.sighup.
 * - ProcessSignal.sigint. Signal sent by e.g. CTRL-C.
 * - ProcessSignal.sigterm. Not available on Windows.
 * - ProcessSignal.sigusr1. Not available on Windows.
 * - ProcessSignal.sigusr2. Not available on Windows.
 * - ProcessSignal.sigwinch. Not available on Windows.
 *
 * Other signals are disallowed, as they may be used by the VM.
 *
 * A signal can be watched multiple times, from multiple isolates, where all
 * callbacks are invoked when signaled, in no specific order.
 *
 * @description Used in test watch_A01_t01.dart to check watch method
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";

void main(args) {
  // This process should die if it never receives a signal.
  var timeout = new Timer(new Duration(seconds: 5), () => exit(1));
  for (var arg in args) {
    var signal;
    switch (arg) {
      case 'SIGHUP':
        signal = ProcessSignal.sighup;
        break;
      case 'SIGINT':
        signal = ProcessSignal.sigint;
        break;
      case 'SIGTERM':
        signal = ProcessSignal.sigterm;
        break;
      case 'SIGUSR1':
        signal = ProcessSignal.sigusr1;
        break;
      case 'SIGUSR2':
        signal = ProcessSignal.sigusr2;
        break;
      case 'SIGWINCH':
        signal = ProcessSignal.sigwinch;
        break;
    }
    signal.watch().first.then((s) {
      if (signal != s) exit(1);
      if (signal.toString() != arg) exit(1);
      print(signal);
      exit(0);
    });
  }
  print("done");
}
