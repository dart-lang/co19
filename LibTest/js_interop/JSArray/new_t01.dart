// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArray<T extends JSAny?>()
/// Creates an empty JavaScript `Array`.
/// Equivalent to `new Array()` and more efficient than `[].jsify()`.
///
/// @description Checks that this constructor creates an empty array in
/// JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  JSArray<JSString> a1 = JSArray<JSString>();
  Expect.equals(0, a1.length);
  globalContext["a1"] = a1;
  eval("var b = a1.length === 0;");
  Expect.isTrue((globalContext["b"] as JSBoolean).toDart);
}
