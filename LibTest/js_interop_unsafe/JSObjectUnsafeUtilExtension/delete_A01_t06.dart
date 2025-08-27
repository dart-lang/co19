// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean delete( JSAny property )
/// Deletes the property with key `property` from this [JSObject].
///
/// @description Check that this function returns `false` when the property is
/// an own non-configurable property in a non-strict mode and throws in the
/// strict mode.
/// @author sgrekhov22@gmail.com
/// @issue 61418

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

main() {
  eval(r'''
    globalThis.obj = {};
    Object.defineProperty(globalThis.obj, "p1", {
      get() {
        return 1;
      },
      configurable: false,
    });
  ''');
  var array = JSArray();
  var obj = globalContext["obj"] as JSObject;
  if (isJS) {
    // The test runner runs compiled JS in a non-strict mode
    Expect.isFalse(array.delete("length".toJS));
    Expect.isFalse(obj.delete("p1".toJS));
  }
  if (isWasm) {
    // In case of dart2wasm compiled code is loaded using modules. It
    // automatically enables the strict mode. In case of the strict mode an
    // error is thrown.
    Expect.throws(() {
      array.delete("length".toJS);
    });
    Expect.throws(() {
      obj.delete("p1".toJS);
    });
  }
}
