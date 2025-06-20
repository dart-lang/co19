// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSFloat32Array([JSArrayBuffer buffer, int byteOffset, int length])
/// Creates a JavaScript `Float32Array` with `buffer` as its backing storage,
/// offset by `byteOffset` bytes, of size `length`.
///
/// If no `buffer` is provided, creates an empty `Float32Array`.
///
/// @description Checks that an object created by this constructor truncates
/// values more that `3.4e38` or less than `-3.4e38`
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(int bufferSize, int offset, int length, num value) {
  JSArrayBuffer buffer = JSArrayBuffer(bufferSize);
  JSFloat32Array ar = JSFloat32Array(buffer, offset, length);
  globalContext["ar"] = ar;
  eval("ar[0] = $value;");
  Expect.throws(() {
    Expect.approxEquals(value, ar.toDart[0]);
  });
}

main() {
  test(4, 0, 1, 3.4e39);
  test(4, 0, 1, -3.4e39);
  test(8, 0, 1, 3.4e39);
  test(8, 0, 1, -3.4e39);
}
