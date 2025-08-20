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
/// @description Check that a [JSObject] returned by [importModule] promise
/// doesn't contain not-exported members.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';

extension type Module(JSObject _) implements JSObject {
  external String notExported();
}

main() {
  var promise = importModule(
      '/root_dart/tests/co19/src/LibTest/js_interop/module.js'.toJS);
  var future = promise.toDart;
  asyncStart();
  future.then((module) {
    var m = Module(module);
    Expect.throws(() {
      m.notExported();
    });
    Expect.isFalse(m.has('notExported'));
    asyncEnd();
  });
}
