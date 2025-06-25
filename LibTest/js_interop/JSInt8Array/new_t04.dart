// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSInt8Array([ JSArrayBuffer buffer, int byteOffset, int length ])
/// Creates a JavaScript `Int8Array` with `buffer` as its backing storage,
/// offset by `byteOffset` bytes, of size `length`.
///
/// If no `buffer` is provided, creates an empty `Int8Array`.
///
/// @description Checks that this constructor creates a JavaScript `Int8Array`
/// with `buffer` as its backing storage, offset by `byteOffset` bytes, of size
/// `length`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(int bufferSize, int offset, int length, int value) {
  JSArrayBuffer buffer = JSArrayBuffer(bufferSize);
  JSInt16Array ar = JSInt16Array(buffer, offset, length);
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
  test(4, 2, 1, 0);
  test(4, 2, 1, 42);
  test(4, 2, 1, -42);

  test(2, 0, 1, 32767);
  test(2, 0, 1, -32768);
  test(4, 2, 1, 32767);
  test(4, 2, 1, -32768);
}
