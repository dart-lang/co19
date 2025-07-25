// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Object? dartify()
/// Converts a JavaScript JSON-like value to the Dart equivalent if possible.
///
/// Effectively the inverse of [NullableObjectUtilExtension.jsify], [dartify]
/// takes a JavaScript JSON-like value and recursively converts it to a Dart
/// object, doing the following:
/// - If the value is a string, number, boolean, `null`, `undefined`,
///   `DataView` or a typed array, does the equivalent `toDart` operation if
///   it exists and returns the result.
/// - If the value is a simple JS object (the prototype is either `null` or JS
///   `Object`), creates and returns a `[Map]<Object?, Object?>` whose keys
///   are the recursively converted keys obtained from `Object.keys` and its
///   values are the associated values of the keys in the JS object.
/// - If the value is a JS `Array`, each item in it is recursively converted
///   and added to a new `[List]<Object?>`, which is then returned.
/// - Otherwise, the conversion is undefined.
///
/// @description Checks that `dartify()` converts JavaScript primitives to Dart
/// types.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.n1 = 1;
    globalThis.n2 = -2;
    globalThis.n3 = -2.2;
    globalThis.n4 = 3.14;
    globalThis.s1 = "JS String";
    globalThis.s2 = "";
    globalThis.b1 = true;
    globalThis.b2 = false;
    globalThis.n = null;
    globalThis.u = undefined;
    ''');
  Expect.equals(1, globalContext["n1"].dartify());
  Expect.equals(-2, globalContext["n2"].dartify());
  Expect.equals(-2.2, globalContext["n3"].dartify());
  Expect.equals(3.14, globalContext["n4"].dartify());
  Expect.equals("JS String", globalContext["s1"].dartify());
  Expect.equals("", globalContext["s2"].dartify());
  Expect.isTrue(globalContext["b1"].dartify());
  Expect.isFalse(globalContext["b2"].dartify());
  Expect.isNull(globalContext["n"].dartify());
  Expect.isNull(globalContext["u"].dartify());
}
