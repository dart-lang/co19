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
 */
import "../../../Utils/expect.dart";
import "dart:io";

test(int dur) {
  DateTime d1 = new DateTime.now();
  sleep(new Duration(milliseconds: dur));
  DateTime d2 = new DateTime.now();
  Expect.isTrue(d2.millisecondsSinceEpoch - d1.millisecondsSinceEpoch >= dur);
}

main(List<String> args) {
  test(5);
  test(100);
  test(100);
  test(100);
  test(1000);
  test(1000);
  test(1000);
  test(0);
}
