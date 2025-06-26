// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///   JSUint8ClampedArray([JSArrayBuffer buffer, int byteOffset, int length])
/// Creates a JavaScript `JSUint8ClampedArray` with `buffer` as its backing
/// storage, offset by `byteOffset` bytes, of size `length`.
///
/// If no `buffer` is provided, creates an empty `JSUint8ClampedArray`.
///
/// @description Checks that if no `buffer` is provided, this constructor
/// creates an empty `JSUint8ClampedArray`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  JSUint8ClampedArray ar = JSUint8ClampedArray();
  globalContext["ar"] = ar;
  eval(r'''
    globalThis.length = ar.length;
    globalThis.byteOffset = ar.byteOffset;
  ''');
  Expect.equals(0, (globalContext["length"] as JSNumber).toDartInt);
  Expect.equals(0, (globalContext["byteOffset"] as JSNumber).toDartInt);
}
