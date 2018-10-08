/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If f is marked async*, then a fresh instance s implementing
 * the built-in class Stream is associated with the invocation and
 * immediately returned. When s is listened to, execution of the body of f will
 * begin. When f terminates:
 *   • If the current return value is defined then, if s has been canceled
 *   then its cancellation future is completed with null.
 *   • If the current exception x is defined:
 *     – x is added to s.
 *     – If s has been canceled then its cancellation future is completed with
 *     x as an error.
 *   • s is closed.
 *
 * @description Check that s is closed if current exception is defined
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

Stream gen1() async* {
  throw 'abc';
}

Stream gen2() async* {
  try {
    throw 'abc';
  } on String catch (e) {
    throw 3.14;
  }
}

test1() {
  asyncStart();
  Stream s = gen1();
  s.listen((v) {
      Expect.fail('Stream, returned by gen1(), should complete with error');
    },
    onError: (e) { // need this to catch the exception
      Expect.equals('abc', e);
    },
    onDone: () {
      asyncEnd();
    }
  );
}

test2() {
  asyncStart();
  Stream s = gen2();
  s.listen((v) {
      Expect.fail('Stream, returned by gen2(), should complete with error');
    },
    onError: (e) { // need this to catch the exception
      Expect.equals(3.14, e);
    },
    onDone: () {
      asyncEnd();
    }
  );
}

main() {
  test1();
  test2();
}
