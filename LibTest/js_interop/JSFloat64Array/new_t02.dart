// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSFloat64Array([JSArrayBuffer buffer, int byteOffset, int length])
/// Creates a JavaScript `Float64Array` with `buffer` as its backing storage,
/// offset by `byteOffset` bytes, of size `length`.
///
/// If no `buffer` is provided, creates an empty `Float64Array`.
///
/// @description Checks that this constructor creates a JavaScript
/// `Float64Array` with `buffer` as its backing storage, offset by `byteOffset`
/// bytes, of size `length`. Test an invocation with one argument.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(int bufferSize, int expectedLength, num value) {
  JSArrayBuffer buffer = JSArrayBuffer(bufferSize);
  JSFloat64Array ar = JSFloat64Array(buffer);
  globalContext["ar"] = ar;
  globalContext["buffer"] = buffer;
  eval("ar[0] = $value;");
  eval(r'''
    globalThis.length = ar.length;
    globalThis.byteOffset = ar.byteOffset;
  ''');
  Expect.equals(expectedLength, (globalContext["length"] as JSNumber).toDartInt);
  Expect.equals(0, (globalContext["byteOffset"] as JSNumber).toDartInt);
  Expect.approxEquals(value, ar.toDart[0]);
}

main() {
  test(8, 1, 0);
  test(8, 1, 42);
  test(8, 1, -1);
  test(16, 2, 3.14);
  test(16, 2, -3.14);

  test(8, 1, 90000000000);
  test(8, 1, -90000000000);
  test(8, 1, 3.4e38);
  test(8, 1, -3.4e38);
}
