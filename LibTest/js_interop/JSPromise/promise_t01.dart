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
/// @description Checks that the [JSPromise] may actually resolve to a type
/// other than `T`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

final completer = Completer<String>();

void complete(String value) {
  completer.complete(value);
}

main() async {
  globalContext["complete"] = complete.toJS;
  eval(r'''
    globalThis.foo = function(resolve, reject) {
      resolve("Success");
    };
  ''');
  JSFunction foo = globalContext["foo"] as JSFunction;
  JSPromise<JSNumber> promise = JSPromise<JSNumber>(foo);
  globalContext["promise"] = promise;
  eval(r'''
    globalThis.promise.then(function(v) {
      globalThis.complete(v);
    });
  ''');
  Expect.equals("Success", await completer.future);
}
