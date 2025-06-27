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
/// @description Checks that an object created by this constructor truncates
/// values more than `255` or less than `0`.
/// @author sgrekhov22@gmail.com
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(int bufferSize, int offset, int length, num value) {
  JSArrayBuffer buffer = JSArrayBuffer(bufferSize);
  JSUint8ClampedArray ar = JSUint8ClampedArray(buffer, offset, length);
  globalContext["ar"] = ar;
  eval("ar[$offset] = $value;");
  Expect.throws(() {
    Expect.equals(value, ar.toDart[offset]);
  });
}

main() {
  test(1, 0, 1, 255 + 1);
  test(2, 0, 1, -1);
  test(4, 1, 1, 255 + 1);
  test(4, 1, 1, -1);
}
