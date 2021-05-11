// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<ProcessSignal> watch()
/// Watch for process signals.
/// The following ProcessSignals can be listened to:
/// - ProcessSignal.sighup.
/// - ProcessSignal.sigint. Signal sent by e.g. CTRL-C.
/// - ProcessSignal.sigterm. Not available on Windows.
/// - ProcessSignal.sigusr1. Not available on Windows.
/// - ProcessSignal.sigusr2. Not available on Windows.
/// - ProcessSignal.sigwinch. Not available on Windows.
///
/// Other signals are disallowed, as they may be used by the VM.
///
/// A signal can be watched multiple times, from multiple isolates, where all
/// callbacks are invoked when signaled, in no specific order.
///
/// @description Checks that mention ProcessSignals can be listened.
/// @author ngl@unipro.ru

import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(ProcessSignal signal, int ec, [int? ec2]) {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  asyncStart();
  Process.start(executable, [
    ...Platform.executableArguments,
    eScript,
    signal.toString()
  ]).then((process) {
    process.stdin.close();
    process.stderr.drain();
    int dokill = 0;
    process.stdout.listen((out) {
      if (dokill < 2) {
        process.kill(signal);
        dokill++;
      }
    });
    process.exitCode.then((exitCode) {
      if (ec2 == null) {
        Expect.equals(ec, exitCode);
      } else {
        Expect.isTrue(
            exitCode == ec || exitCode == ec2, "exitCode is $exitCode");
      }
      asyncEnd();
    });
  });
}

runMain() {
  if (!Platform.isWindows) {
    check(ProcessSignal.sighup, -1);
    check(ProcessSignal.sigint, -2);
    check(ProcessSignal.sigterm, -15);
    check(ProcessSignal.sigusr1, -10, -30);
    check(ProcessSignal.sigusr2, -12, -31);
    // ProcessSignal.sigwinch does not kill process
    check(ProcessSignal.sigwinch, 0);
  }
}

runProcess(List<String> args) {
  // This process should die if it never receives a signal.
  var timeout = new Timer(new Duration(seconds: 5), () => exit(1));

  var sigCount = 0;
  var li1;
  bool sigw = false;

  void check() {
    if (sigCount > 1) {
      exit(1);
    }
    if (sigw && (sigCount == 1)) {
      exit(0);
    }
    if (sigCount == 1) {
      li1.cancel();
    }
    print("ready");
  }

  var signal;
  switch (args[0]) {
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

  li1 = signal.watch().listen((lsignal) {
    if (lsignal != signal) {
      exit(1);
    }
    sigCount++;
    if (signal == ProcessSignal.sigwinch) {
      sigw = true;
    }
    check();
  });

  check();
}

main(List<String> args) {
  if (args.length > 0)
    runProcess(args);
  else {
    runMain();
  }
}
