/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If f is marked async, then a fresh instance o implementing the
 * built-in class Future is associated with the invocation and immediately
 * returned to the caller. The body of f is scheduled for execution at some
 * future time. The future o will complete when f terminates. The value used
 * to complete o is the current return value, if it is defined, and the
 * current exception otherwise.
 *
 * @description Check that returned future o is completed with value returned
 * by the body of the executed function
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

Future test1() async {
  return null;
}

Future<int> test2() async {
  return 1;
}

Future test3() async {
  return 'abc';
}

Future test4(x) async {
  return x;
}

Future test5(x) async {
  try {
    return x;
  } finally {
    return 'finally';
  }
}

main() {
  asyncStart();
  List expected = [null, 1, 'abc', 3.14, 'finally'];
  Future.wait([test1(), test2(), test3(), test4(3.14), test5(3.14)]).then(
      (List actual) {
        Expect.listEquals(expected, actual);
        asyncEnd();
      }
  );
}
