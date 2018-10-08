/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void reset()
 * Resets the elapsed count to zero.
 * This method does not stop or start the Stopwatch.
 * @description Checks that this method resets the elapsed count to zero.
 * @author sgrekhov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

Duration delay = durationMs(50);
Stopwatch sw = new Stopwatch();
int e0;

main() {
  sw.start();
  e0 = sw.elapsedTicks;
  asyncStart();
  new Timer(delay, proc1);
}

void proc1() {
  int e1 = sw.elapsedTicks;
  Expect.isTrue(e1 > e0);
  sw.reset();
  Expect.isTrue(e1 > sw.elapsedTicks);
  asyncEnd();
}
