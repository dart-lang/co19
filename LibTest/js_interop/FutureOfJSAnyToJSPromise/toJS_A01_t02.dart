// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSPromise<T> get toJS
/// A [JSPromise] that either resolves with the result of the completed [Future]
/// or rejects with an object that contains its error.
///
/// The rejected object contains the original error as a [JSBoxedDartObject] in
/// the property `error` and the original stack trace as a [String] in the
/// property `stack`.
///
/// @description Checks that [JSPromise] created by this property completes with
/// the value with which the [Future] was completed. Test a [Future] created by
/// [Future.value] constructor.
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

main() {
  globalContext["complete"] = complete.toJS;
  Future<JSString> future = Future.value("Success".toJS);
  JSPromise promise = future.toJS;
  globalContext["promise"] = promise;
  eval(r'''
    globalThis.promise.then((v) => {
      globalThis.result = v;
      globalThis.complete(v);
    });
  ''');
  asyncStart();
  completer.future.then((_) {
    Expect.equals("Success", (globalContext["result"] as JSString).toDart);
    asyncEnd();
  });
}
