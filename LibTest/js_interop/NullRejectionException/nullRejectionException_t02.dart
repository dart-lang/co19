// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exception for when the promise is rejected with a `null` or
/// `undefined` value.
///
/// @description Checks that this exception is thrown when the promise is
/// rejected with an `undefined` value.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.promise = new Promise(function(resolve, reject) {
      reject(undefined);
    });
  ''');
  JSPromise promise = globalContext["promise"] as JSPromise;
  asyncStart();
  promise.toDart.then((v) {
    Expect.fail("NullRejectionException expected");
  }).onError((e, st) {
    Expect.isTrue(e is NullRejectionException);
    if (isJS) {
      Expect.isTrue((e as NullRejectionException).isUndefined);
    } else if (isWasm) {
      Expect.isFalse((e as NullRejectionException).isUndefined);
    }
    asyncEnd();
  });
}
