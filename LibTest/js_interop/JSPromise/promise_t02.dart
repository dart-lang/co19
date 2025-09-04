// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript `Promise` or a promise-like object.
///
/// Because [JSPromise] is an extension type, `T` is only a static guarantee and
/// the [JSPromise] may not actually resolve to a `T`.
///
/// Also like with [JSArray], `T` may introduce additional checking elsewhere.
/// When converted to a `Future<T>`, there is a cast to ensure that the [Future]
/// actually resolves to a `T` to ensure soundness.
///
/// @description Checks that when converted to a `Future` `JSPromise<T>` is
/// converted to `Future<T>`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.foo = function(resolve, reject) {
      resolve("Success");
    };
  ''');
  JSFunction foo = globalContext["foo"] as JSFunction;
  JSPromise<JSString> promise = JSPromise<JSString>(foo);
  var fp = promise.toDart;
  Expect.isTrue(fp is Future<JSString>);
  asyncStart();
  fp.then((v) {
    Expect.equals("Success", v.toDart);
    asyncEnd();
  });
}
