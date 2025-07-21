// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Object? dartify()
/// Converts a JavaScript value to the Dart equivalent if possible.
///
/// Effectively the inverse of `NullableObjectUtilExtension.jsify`, `dartify`
/// takes a JavaScript value and recursively converts it to a Dart object. Only
/// JavaScript primitives, `Arrays`, typed arrays, and map-like objects with
/// string property names are supported.
///
/// @description Checks that `dartify()` converts JavaScript arrays to Dart
/// `List`s.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.a1 = [];
    globalThis.a2 = [1, 0, -2];
    globalThis.a3 = [1.1, 0, -3.14];
    globalThis.a4 = [0, true, "two", null];
    ''');
  Expect.listEquals([], globalContext["a1"].dartify());
  Expect.listEquals([1, 0, -2], globalContext["a2"].dartify());
  Expect.listEquals([1.1, 0, -3.14], globalContext["a3"].dartify());
  Expect.listEquals([0, true, "two", null], globalContext["a4"].dartify());
}
