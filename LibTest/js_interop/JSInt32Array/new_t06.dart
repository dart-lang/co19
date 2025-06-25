// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSInt32Array([JSArrayBuffer buffer, int byteOffset, int length])
/// Creates a JavaScript `Int32Array` with `buffer` as its backing storage,
/// offset by `byteOffset` bytes, of size `length`.
///
/// If no buffer is provided, creates an empty `Int32Array`.
///
/// @description Checks that an object created by this constructor truncates
/// values more than `2147483647` or less than `-2147483648`.
/// @author sgrekhov22@gmail.com
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(int bufferSize, int offset, int length, num value) {
  JSArrayBuffer buffer = JSArrayBuffer(bufferSize);
  JSInt16Array ar = JSInt16Array(buffer, offset, length);
  globalContext["ar"] = ar;
  eval("ar[0] = $value;");
  Expect.throws(() {
    Expect.equals(value, ar.toDart[0]);
  });
}

main() {
  test(4, 0, 1, 2147483647 + 1);
  test(4, 0, 1, -2147483648 - 1);
  test(8, 4, 1, 2147483647 + 1);
  test(16, 4, 2, -2147483648 - 1);
}
