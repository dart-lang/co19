/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Duration elapsed
 * Returns the elapsedTicks counter converted to a Duration.
 * @description Checks that this method returns 0 if the stopwatch has never
 * been started.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

Duration delay = durationMs(50);
Stopwatch sw = new Stopwatch();

main() {
  asyncStart();
  new Timer(delay, proc1);
}

void proc1() {
  Duration e1 = sw.elapsed;
  Expect.equals(0, e1.inMicroseconds);
  asyncEnd();
}
