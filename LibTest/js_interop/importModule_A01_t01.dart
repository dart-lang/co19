// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSPromise<JSObject> importModule( JSAny moduleName )
///
/// Dynamically imports a JavaScript module with the given `moduleName` using
/// the JavaScript `import()` syntax.
///
/// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/import
/// for more details.
///
/// Returns a [JSPromise] that resolves to a [JSObject] that's the module
/// namespace object.
///
/// @description Check that [importModule] imports a JavaScript module with the
/// given `moduleName` and returns a [JSPromise] that resolves to a [JSObject]
/// that's the module namespace object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';

extension type Module(JSObject _) implements JSObject {
  external int answer();
}

extension type A._(JSObject _) implements JSObject {
  external A(id, name);
  external get id;
}

extension type C(JSObject _) implements JSObject {
  external C.c();
  external String foo();
  external static String bar();
}

main() {
  var promise = importModule(
      '/root_dart/tests/co19/src/LibTest/js_interop/module.js'.toJS);
  var future = promise.toDart;
  asyncStart();
  future.then((module) {
    var m = Module(module);
    Expect.equals(42, m.answer());
    Expect.equals("C.foo() from module.js", C.c().foo());
    Expect.equals("C.bar() from module.js", C.bar());
    asyncEnd();
  });
}
