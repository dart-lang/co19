/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 *
 * @description Checks that method [toString()] returns a string representation
 * of this object.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(String sig) {
  var signal;
  switch (sig) {
    case 'SIGHUP':
      signal = ProcessSignal.SIGHUP;
      break;
    case 'SIGINT':
      signal = ProcessSignal.SIGINT;
      break;
    case 'SIGTERM':
      signal = ProcessSignal.SIGTERM;
      break;
    case 'SIGUSR1':
      signal = ProcessSignal.SIGUSR1;
      break;
    case 'SIGUSR2':
      signal = ProcessSignal.SIGUSR2;
      break;
    case 'SIGWINCH':
      signal = ProcessSignal.SIGWINCH;
      break;
  }
  Expect.isTrue(signal is ProcessSignal);
  Expect.isTrue(signal.toString() is String);
  Expect.equals(signal.toString(), sig);
}

main() {
//  if (!Platform.isWindows) {
    check('SIGHUP');
    check('SIGINT');
    check('SIGTERM');
    check('SIGUSR1');
    check('SIGUSR2');
    check('SIGWINCH');
//  }
}
