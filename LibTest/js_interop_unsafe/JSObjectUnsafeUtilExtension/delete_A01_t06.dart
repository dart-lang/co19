// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean delete( JSAny property )
/// Deletes the property with key `property` from this [JSObject].
///
/// @description Check that this function returns `false` when the property is
/// an own non-configurable property.
/// @author sgrekhov22@gmail.com
/// @issue 61418

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

main() {
  eval(r'''
    "use strict";
    globalThis.obj = {};
    Object.defineProperty(globalThis.obj, "p1", {
      get() {
        return 1;
      },
      configurable: false,
    });
  ''');
  var array = JSArray();
  Expect.isFalse(array.delete("length".toJS));
  var obj = globalContext["obj"] as JSObject;
  Expect.isFalse(obj.delete("p1".toJS));
}
