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
/// @description Checks that this type represents a native unsigned long int in
/// C.
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<UnsignedLong> p1 = calloc<UnsignedLong>();
  try {
    p1.value = 42;
    Expect.equals(42, p1.value);
    p1.value = 32768;
    Expect.equals(32768, p1.value);
    p1.value = 0x7FFFFFFF;
    Expect.equals(2147483647, p1.value);
    p1.value = 0x80000000;
    Expect.equals(2147483648, p1.value);
    p1.value = -42;
    Expect.equals(4294967254, p1.value);
  } finally {
    calloc.free(p1);
  }
}
