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
/// `length`. Test that `length == 0` creates an empty array.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  JSArrayBuffer buffer = JSArrayBuffer(2);
  JSInt32Array ar = JSInt32Array(buffer, 0, 0);
  globalContext["ar"] = ar;
  globalContext["buffer"] = buffer;
  eval(r'''
    globalThis.length = ar.length;
  ''');
  Expect.equals(0, (globalContext["length"] as JSNumber).toDartInt);
}
