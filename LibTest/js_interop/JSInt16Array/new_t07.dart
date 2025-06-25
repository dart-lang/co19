// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSInt16Array([JSArrayBuffer buffer, int byteOffset, int length])
/// Creates a JavaScript `Int16Array` with `buffer` as its backing storage,
/// offset by `byteOffset` bytes, of size `length`.
///
/// If no buffer is provided, creates an empty `Int16Array`.
///
/// @description Checks that this constructor throws if `byteOffset` or `length`
/// are negative.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  JSArrayBuffer buffer = JSArrayBuffer(2);
  Expect.throws(() {
    JSInt16Array(buffer, -1);
  });
  Expect.throws(() {
    JSInt16Array(buffer, 0, -1);
  });
  Expect.throws(() {
    JSInt16Array(buffer, 1, -1);
  });
}
