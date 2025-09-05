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
/// @description Checks that if the [Future] completes with an error then the
/// rejected object contains the original error as a [JSBoxedDartObject] in the
/// property `error` and the original stack trace as a [String] in the property
/// `stack`.
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

extension type Error(JSObject _) implements JSObject {
  @JS()
  external JSBoxedDartObject get error;
  @JS()
  external String get stack;
}

main() {
  globalContext["complete"] = complete.toJS;
  Future<JSNumber> future = Future.error(
    "The error",
    StackTrace.fromString("Stack trace"),
  );
  JSPromise promise = future.toJS;
  globalContext["promise"] = promise;
  eval(r'''
    globalThis.promise.then((v) => {
      globalThis.result = v;
      globalThis.complete("");
    }, (e) => {
      globalThis.error = e;
      globalThis.complete("");
    });
  ''');
  asyncStart();
  completer.future.then((_) {
    Error error = globalContext["error"] as Error;
    Expect.equals("The error", error.error.toDart);
    Expect.equals("Stack trace", error.stack);
    asyncEnd();
  });
}
