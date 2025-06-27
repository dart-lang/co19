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
/// @description Checks that this constructor creates a JavaScript
/// `JSUint8ClampedArray` with `buffer` as its backing storage, offset by
/// `byteOffset` bytes, of size `length`. Test an invocation with two arguments.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(int bufferSize, int offset, int expectedLength, int value) {
  JSArrayBuffer buffer = JSArrayBuffer(bufferSize);
  JSUint8Array ar = JSUint8Array(buffer, offset);
  globalContext["ar"] = ar;
  globalContext["buffer"] = buffer;
  eval("ar[0] = $value;");
  eval(r'''
    globalThis.length = ar.length;
    globalThis.byteOffset = ar.byteOffset;
  ''');
  Expect.equals(expectedLength, (globalContext["length"] as JSNumber).toDartInt);
  Expect.equals(offset, (globalContext["byteOffset"] as JSNumber).toDartInt);
  Expect.equals(value, ar.toDart[0]);
}

main() {
  test(1, 0, 1, 0);
  test(1, 0, 1, 42);
  test(2, 1, 1, 1);
  test(4, 1, 3, 42);
  test(1, 0, 1, 255);
  test(2, 0, 2, 255);
}
