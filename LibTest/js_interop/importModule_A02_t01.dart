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
/// @description Check that returned [JSPromise] completes with an error if
/// `moduleName` is not a valid path to a JS module.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';

main() {
  var promise = importModule('Not existing'.toJS);
  var future = promise.toDart;
  asyncStart();
  future.then((module) {
    Expect.fail("Future should be completed with error");
  }, onError: (_) {
    asyncEnd();
  });
}
