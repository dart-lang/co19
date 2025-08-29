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
  test(JSArray(), "length".toJS);
  test(globalContext["obj"] as JSObject, "p1".toJS);
}

test(JSObject obj, JSString property) {
  bool falseOrException = false;
  try {
    // In case of non-strict mode expecting false
    falseOrException = !obj.delete(property).toDart;
  } catch (_) {
    // In case of strict mode expecting an exception
    falseOrException = true;
  }
  Expect.isTrue(falseOrException);
}
