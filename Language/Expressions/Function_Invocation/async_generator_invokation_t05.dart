// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If f is marked async*, then a fresh instance s implementing
/// the built-in class Stream is associated with the invocation and
/// immediately returned. When s is listened to, execution of the body of f will
/// begin. When f terminates:
///   • If the current return value is defined then, if s has been canceled
///   then its cancellation future is completed with null.
///   • If the current exception x is defined:
///     – x is added to s.
///     – If s has been canceled then its cancellation future is completed with
///     x as an error.
///   • s is closed.
///
/// @description Check that current exception is added to s
///
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../Utils/expect.dart';

Stream generator1() async* {
  throw 'abc';
}

Stream generator2() async* {
  try {
    throw 'abc';
  } on String catch (e) {
    throw 3.14;
  }
}

test1() {
  asyncStart();
  Stream stream = generator1();
  stream.listen(
    (v) {
      Expect.fail('Stream, returned by gen1(), should complete with error');
    },
    onError: (e) {
      Expect.equals('abc', e);
      asyncEnd();
    }
  );
}

test2() {
  asyncStart();
  Stream stream = generator2();
  stream.listen(
    (v) {
      Expect.fail('Stream, returned by generator2(), should complete with error');
    },
    onError: (e) {
      Expect.equals(3.14, e);
      asyncEnd();
    }
  );
}

main() {
  test1();
  test2();
}
