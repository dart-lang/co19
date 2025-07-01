// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSPromise<T extends JSAny?>( JSFunction executor )
///
/// @description Checks that this constructor creates a JavaScript `Promise`.
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
  JSPromise promise = JSPromise(foo);
  globalContext["promise"] = promise;
  eval(r'''
    globalThis.promise.then(function(v) {
      globalThis.complete(v);
    });
  ''');
  Expect.equals("Success", await completer.future);
}
