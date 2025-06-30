// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Creates a new empty JavaScript object.
///
/// The object is created using the JavaScript object initializer syntax (`{}`),
/// and this constructor is more efficient than `{}.jsify()`.
///
/// @description Checks that this constructor creates an empty JavaScript object
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

main() {
  JSObject o = JSObject();
  globalContext["o"] = o;
  eval(r'''
    globalThis.keys = Object.keys(globalThis.o);
  ''');
  jsExpectArrayEquals(JSArray(), globalContext["keys"]);
}
