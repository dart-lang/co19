// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C long long type.
///
/// Typically a signed 64-bit integer. For a guaranteed 64-bit integer, use
/// [Int64] with the C int64_t type. For an unsigned long long, use
/// [UnsignedLongLong].
///
/// The [LongLong] type is a native type, and should not be constructed in Dart
/// code. It occurs only in native type signatures and as annotation on [Struct]
/// and [Union] fields.
///
/// @description Checks that this type is a signed 64-bit integer
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<LongLong> p1 = calloc<LongLong>(2);
  try {
    Expect.equals(8, (p1 + 1).address - p1.address);
    Expect.equals(8, sizeOf<LongLong>());
  } finally {
    calloc.free(p1);
  }
}
