// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSInt8Array([ JSArrayBuffer buffer, int byteOffset, int length ])
/// Creates a JavaScript `Int8Array` with `buffer` as its backing storage,
/// offset by `byteOffset` bytes, of size `length`.
///
/// If no `buffer` is provided, creates an empty `Int8Array`.
///
/// @description Checks that an object created by this constructor truncates
/// values more than `127` or less than `-128`.
/// @author sgrekhov22@gmail.com
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(int bufferSize, int offset, int length, num value) {
  JSArrayBuffer buffer = JSArrayBuffer(bufferSize);
  JSInt8Array ar = JSInt8Array(buffer, offset, length);
  globalContext["ar"] = ar;
  eval("ar[0] = $value;");
  Expect.throws(() {
    Expect.equals(value, ar.toDart[0]);
  });
}

main() {
  test(1, 0, 1, 127 + 1);
  test(2, 0, 1, -128 - 1);
  test(4, 1, 1, 127 + 1);
  test(4, 1, 1, -128 - 1);
}
