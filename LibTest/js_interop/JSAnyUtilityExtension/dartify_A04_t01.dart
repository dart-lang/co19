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
/// @description Checks that `dartify()` converts JavaScript `DataView` to a
/// Dart object and is the equivalent of `toDart` operation.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.buffer = new ArrayBuffer(2);
    globalThis.dv = new DataView(buffer);
    globalThis.dv.setInt16(0, 42, true);
  ''');
  JSDataView dv = globalContext["dv"] as JSDataView;
  // The result of `dartify()` is an internal Dart object with unspecified
  // properties. Let's check that these objects have the same string
  // representation.
  Expect.equals(dv.toDart.toString(), dv.dartify().toString());
}
