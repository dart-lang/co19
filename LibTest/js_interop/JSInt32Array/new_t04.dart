// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSInt32Array([JSArrayBuffer buffer, int byteOffset, int length])
/// Creates a JavaScript `Int32Array` with `buffer` as its backing storage,
/// offset by `byteOffset` bytes, of size `length`.
///
/// If no buffer is provided, creates an empty `Int32Array`.
///
/// @description Checks that this constructor creates a JavaScript `Int32Array`
/// with `buffer` as its backing storage, offset by `byteOffset` bytes, of size
/// `length`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(int bufferSize, int offset, int length, int value) {
  JSArrayBuffer buffer = JSArrayBuffer(bufferSize);
  JSInt32Array ar = JSInt32Array(buffer, offset, length);
  globalContext["ar"] = ar;
  globalContext["buffer"] = buffer;
  eval("ar[0] = $value;");
  eval(r'''
    globalThis.length = ar.length;
    globalThis.byteOffset = ar.byteOffset;
  ''');
  Expect.equals(length, (globalContext["length"] as JSNumber).toDartInt);
  Expect.equals(offset, (globalContext["byteOffset"] as JSNumber).toDartInt);
  Expect.equals(value, ar.toDart[0]);
}

main() {
  test(8, 4, 1, 0);
  test(4, 0, 1, 42);
  test(16, 8, 2, -42);

  test(32, 0, 2, 2147483647);
  test(8, 4, 1, -2147483648);
  test(4, 0, 1, 2147483647);
  test(4, 0, 1, -2147483648);
}
