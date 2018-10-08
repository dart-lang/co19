/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a rethrow statement proceeds as follows:
 * Let f be the immediately enclosing function, and let on T catch (p1, p2) be
 * the immediately enclosing catch clause.
 * The current exception is set to p1, the current return value becomes
 * undefined, and the active stack trace is set to p2.
 * If f is marked async or async* and there is a dynamically enclosing exception
 * handler h introduced by the current activation, control is transferred to h,
 * otherwise f terminates.
 *
 * @description Checks that if rethrow occurs in function f marked async and
 * there is a dynamically enclosing exception handler h in f, than control is
 * transferred to h.
 *
 * @author ngl@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

String s = "abc";
int r = 0;

test1() {
  throw s;
}

Future test() async {
  try {
    try {
      r += 1;
      test1();
      r += 2;
    } on String catch (p1, p2) {
      r += 4;
      rethrow;
    }
  } on String catch (p1, p2) {
    r += 8;
  }
  return 5;
}

main() {
  asyncStart();
  test().then((v) {
    Expect.equals(1 + 4 + 8, r);
    Expect.equals(5, v);
    asyncEnd();
  });
}
