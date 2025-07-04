// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exception for when the promise is rejected with a `null` or
/// `undefined` value.
///
/// @description Checks that this exception doesn't throw occurs when the
/// promise is rejected with not a `null` or `undefined` value.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(Object value, Object expected) {
  eval("globalThis.rejectValue = $value;");
  eval(r'''
    globalThis.promise = new Promise(function(resolve, reject) {
      reject(globalThis.rejectValue);
    });
  ''');
  JSPromise promise = globalContext["promise"] as JSPromise;
  promise.toDart.then((v) {
    Expect.fail("Exception expected");
  }).onError((e, st) {
    Expect.isFalse(e is NullRejectionException);
    Expect.equals(expected, (e as JSAny).dartify());
    asyncEnd();
  });
}

main() {
  asyncStart(6);
  test(42, 42);
  test(0, 0);
  test("''", "");
  test(false, false);
  test(true, true);
  test("'Some string'", "Some string");
}
