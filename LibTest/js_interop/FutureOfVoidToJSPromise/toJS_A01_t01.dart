// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSPromise<JSAny?> get toJS
/// A JSPromise that either resolves once this [Future] completes or rejects
/// with an object that contains its error.
///
/// The rejected object contains the original error as a [JSBoxedDartObject] in
/// the property `error` and the original `stack` trace as a [String] in the
/// property stack.
///
/// @description Checks that [JSPromise] created by this property completes and
/// the value with which the [Future] was completed is ignored.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

final completer = Completer<void>();

void complete() {
  completer.complete();
}

main() {
  globalContext["complete"] = complete.toJS;
  Future<void> future = Future.delayed(Duration(milliseconds: 100), () {
    return "Success".toJS;
  });
  JSPromise promise = future.toJS;
  globalContext["promise"] = promise;
  eval(r'''
    globalThis.promise.then((v) => {
      globalThis.result = v;
      globalThis.complete();
    });
  ''');
  asyncStart();
  completer.future.then((_) {
    Expect.isNull(globalContext["result"]);
    asyncEnd();
  });
}
