// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<T> get toDart
/// A [Future] that either completes with the result of the resolved [JSPromise]
/// or propagates the error that the [JSPromise] rejected with.
///
/// @description Checks that a [Future] returned by this property completes with
/// with an error with which the JS Promise was rejected.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.promise = new Promise((resolve, reject) => {
      setTimeout(() => {
        reject("Reason");
      }, 100);
    });
  ''');
  JSPromise<JSString> promise = globalContext["promise"] as JSPromise<JSString>;
  Future<JSString> future = promise.toDart;
  future.then(
    (v) {
      Expect.fail("The feature should be completed with an error");
    },
    onError: (e) {
      Expect.equals("Reason", (e as JSString).toDart);
      asyncEnd();
    },
  );
}
