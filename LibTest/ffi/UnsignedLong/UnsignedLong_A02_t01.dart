// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C unsigned long int, aka. unsigned long, type.
///
/// Typically an unsigned 32- or 64-bit integer. For a guaranteed 32-bit
/// integer, use [Uint32] with the C uint32_t type. For a guaranteed 64-bit
/// integer, use [Uint64] with the C uint64_t type. For a signed long, use
/// [Long].
///
/// The [UnsignedLong] type is a native type, and should not be constructed in
/// Dart code. It occurs only in native type signatures and as annotation on
/// [Struct] and [Union] fields.
///
/// @description Checks that this type is an unsigned 32- or 64-bit integer.
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<UnsignedLong> p1 = calloc<UnsignedLong>(2);
  try {
    Expect.isTrue((p1 + 1).address - p1.address == 4 ||
        (p1 + 1).address - p1.address == 8);
    Expect.isTrue(sizeOf<UnsignedLong>() == 4 || sizeOf<UnsignedLong>() == 8);
  } finally {
    calloc.free(p1);
  }
}
