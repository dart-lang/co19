/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void sleep(Duration duration)
 * Sleep for the duration specified in [duration].
 * @description Checks that process sleeps for the [duration] milliseconds.
 * @author iarkh@unipro.ru
 * @issue 25757
 */
import "../../../Utils/expect.dart";
import "dart:io";

test(int dur) {
  Stopwatch sw = new Stopwatch();
  sw.start();
  sleep(new Duration(milliseconds: dur));
  sw.stop();

  print("Acually slept for: milliseconds: ${sw.elapsedMilliseconds}, " +
      "microseconds: ${sw.elapsedMicroseconds}");
  Expect.isTrue(sw.elapsedMilliseconds >= dur - 1);
}

main() {
  test(5);
  test(100);
  test(100);
  test(100);
  test(1000);
  test(1000);
  test(1000);
  test(0);
}
