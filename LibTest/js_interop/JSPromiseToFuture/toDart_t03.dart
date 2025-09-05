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

@JS("Error")
extension type Error(JSObject _) implements JSObject {
  @JS("toString")
  external String toDartString();
}

main() {
  eval(r'''
    globalThis.promise = new Promise((resolve, reject) => {
      setTimeout(() => {
        reject(new Error("Something went wrong!"));
      }, 100);
    });
  ''');
  JSPromise<JSString> promise = globalContext["promise"] as JSPromise<JSString>;
  Future<JSString> future = promise.toDart;
  asyncStart();
  future.then(
    (v) {
      Expect.fail("The feature should be completed with an error");
    },
    onError: (e) {
      // JS Error adds "Error:" before the message. Therefore let's check the
      // end of the string
      Expect.isTrue(
        (e as Error).toDartString().endsWith("Something went wrong!"),
      );
      asyncEnd();
    },
  );
}
