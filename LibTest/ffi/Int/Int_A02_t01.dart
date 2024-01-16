// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C int type.
///
/// Typically a signed 32-bit integer. For a guaranteed 32-bit integer, use
/// [Int32] with the C int32_t type. For an unsigned int, use [UnsignedInt].
///
/// The [Int] type is a native type, and should not be constructed in Dart code.
/// It occurs only in native type signatures and as annotation on [Struct] and
/// [Union] fields.
///
/// @description Checks that this type represents a signed 32-bit integer
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Int> p1 = calloc<Int>(2);
  try {
    Expect.equals(4, (p1 + 1).address - p1.address);
    Expect.equals(4, sizeOf<Int>());
  } finally {
    calloc.free(p1);
  }
}
