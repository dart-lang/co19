// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSUint8Array([JSArrayBuffer buffer, int byteOffset, int length])
/// Creates a JavaScript `Uint8Array` with `buffer` as its backing storage,
/// offset by `byteOffset` bytes, of size `length`.
///
/// If no `buffer` is provided, creates an empty `Uint8Array`.
///
/// @description Checks that this constructor creates a JavaScript `Uint8Array`
/// with `buffer` as its backing storage, offset by `byteOffset` bytes, of size
/// `length`. Test an invocation with one argument.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(int bufferSize, int expectedLength, int value) {
  JSArrayBuffer buffer = JSArrayBuffer(bufferSize);
  JSUint8Array ar = JSUint8Array(buffer);
  globalContext["ar"] = ar;
  globalContext["buffer"] = buffer;
  eval("ar[0] = $value;");
  eval(r'''
    globalThis.length = ar.length;
    globalThis.byteOffset = ar.byteOffset;
  ''');
  Expect.equals(expectedLength, (globalContext["length"] as JSNumber).toDartInt);
  Expect.equals(0, (globalContext["byteOffset"] as JSNumber).toDartInt);
  Expect.equals(value, ar.toDart[0]);
}

main() {
  test(1, 1, 0);
  test(1, 1, 42);
  test(2, 2, 1);
  test(1, 1, 255);
  test(2, 2, 255);
}
