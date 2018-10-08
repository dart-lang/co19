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
 * @description Check that returned future o is completed with error thrown
 * by the body of the executed function
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

var executionFinishedTime = null;

Future test1() async {
  throw 0;
}

Future<int> test2() async {
  throw 1;
}

Future test3() async {
  throw 'abc';
}

Future test4(x) async {
  throw x;
}

Future test5(x) async {
  try {
    throw x;
  } finally {
    throw 'finally';
  }
}

main() {
  asyncStart();
  test1().then(
      (_) => Expect.fail('test1 should throw null'),
      onError: (e) {
        Expect.equals(0, e);
      })
  .then((_) => test2()).then(
      (_) => Expect.fail('test2 should throw 1'),
      onError: (e) {
        Expect.equals(1, e);
      }
  ).then((_) => test3()).then(
      (_) => Expect.fail('test3 should throw \'abc\''),
      onError: (e) {
        Expect.equals('abc', e);
      }
  ).then((_) => test4(3.14)).then(
      (_) => Expect.fail('test4 should throw 3.14'),
      onError: (e) {
        Expect.equals(3.14, e);
      }
  ).then((_) => test5(3.14)).then(
      (_) => Expect.fail('test5 should throw \'finally\''),
      onError: (e) {
        Expect.equals('finally', e);
        asyncEnd();
      }
  );
}
