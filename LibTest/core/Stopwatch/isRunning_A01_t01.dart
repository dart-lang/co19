/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isRunning
 * Whether the StopWatch is currently running.
 * @description Checks that this property returns true if the StopWatch is
 * currently running
 * @author sgrekhov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

Duration delay = durationMs(20);
Stopwatch sw = new Stopwatch();

main() {
  Expect.isFalse(sw.isRunning);
  sw.start();
  asyncStart();
  new Timer(delay,proc1);
}

void proc1() {
  Expect.isTrue(sw.isRunning);
  asyncEnd();
}
