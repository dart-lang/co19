// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Creates a new empty JavaScript object.
///
/// The object is created using the JavaScript object initializer syntax (`{}`),
/// and this constructor is more efficient than `{}.jsify()`.
///
/// @description Checks that this constructor creates a new JavaScript object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  JSObject o1 = JSObject();
  JSObject o2 = JSObject();
  globalContext["o1"] = o1;
  globalContext["o2"] = o2;
  eval(r'''
    globalThis.res = globalThis.o1 == globalThis.o2;
  ''');
  Expect.isFalse((globalContext["res"] as JSBoolean).toDart);
}
