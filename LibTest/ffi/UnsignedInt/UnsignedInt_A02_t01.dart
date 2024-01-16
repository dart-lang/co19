// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C unsigned int type.
///
/// Typically an unsigned 32-bit integer. For a guaranteed 32-bit integer, use
/// [Uint32] with the C uint32_t type. For a signed int, use [Int].
///
/// The [UnsignedInt] type is a native type, and should not be constructed in
/// Dart code. It occurs only in native type signatures and as annotation on
/// [Struct] and [Union] fields.
///
/// @description Checks that this type represents is an unsigned 32-bit integer
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<UnsignedInt> p1 = calloc<UnsignedInt>(2);
  try {
    Expect.equals(4, (p1 + 1).address - p1.address);
    Expect.equals(4, sizeOf<UnsignedInt>());
  } finally {
    calloc.free(p1);
  }
}
