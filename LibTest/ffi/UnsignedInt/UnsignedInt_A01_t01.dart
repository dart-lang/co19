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
/// @description Checks that this type represents C unsigned int type.
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<UnsignedInt> p1 = calloc<UnsignedInt>();
  try {
    p1.value = 42;
    Expect.equals(42, p1.value);
    p1.value = -42;
    Expect.equals((-42).toUnsigned(32), p1.value);
    p1.value = 32768;
    Expect.equals(32768, p1.value);
    p1.value = 0xFFFF8000; // -32768
    Expect.equals(0xFFFF8000, p1.value);
    p1.value = 0x7FFFFFFF; // 2147483647
    Expect.equals(2147483647, p1.value);
    p1.value = 2147483648;
    Expect.equals(2147483648, p1.value);
    p1.value = -2147483649;
    Expect.equals(2147483647, p1.value);
  } finally {
    calloc.free(p1);
  }
}
