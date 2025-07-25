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
/// @description Checks that `dartify()` converts JavaScript typed arrays to
/// Dart `List`s from `dart:typed_data`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  JSFloat32Array ar1 = JSFloat32Array();
  Expect.isTrue(ar1.dartify() is Float32List);

  JSFloat64Array ar2 = JSFloat64Array();
  Expect.isTrue(ar2.dartify() is Float64List);

  JSInt8Array ar3 = JSInt8Array();
  Expect.isTrue(ar3.dartify() is Int8List);

  JSInt16Array ar4 = JSInt16Array();
  Expect.isTrue(ar4.dartify() is Int16List);

  JSInt32Array ar5 = JSInt32Array();
  Expect.isTrue(ar5.dartify() is Int32List);

  JSUint8Array ar6 = JSUint8Array();
  Expect.isTrue(ar6.dartify() is Uint8List);

  JSUint16Array ar7 = JSUint16Array();
  Expect.isTrue(ar7.dartify() is Uint16List);

  JSUint32Array ar8 = JSUint32Array();
  Expect.isTrue(ar8.dartify() is Uint32List);
}
