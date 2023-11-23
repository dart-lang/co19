// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C unsigned long long type.
///
/// Typically an unsigned 64-bit integer. For a guaranteed 64-bit integer, use
/// [Uint64] with the C uint64_t type. For a signed long long, use [LongLong].
///
/// The [UnsignedLongLong] type is a native type, and should not be constructed
/// in Dart code. It occurs only in native type signatures and as annotation on
/// [Struct] and [Union] fields.
///
/// @description Checks that this type represents C unsigned long long type
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<UnsignedLongLong> p1 = calloc<UnsignedLongLong>();
  try {
    p1.value = 42;
    Expect.equals(42, p1.value);
    p1.value = -42;
    Expect.equals(-42, p1.value);
    p1.value = 32768;
    Expect.equals(32768, p1.value);
    p1.value = 2147483648;
    Expect.equals(2147483648, p1.value);
    p1.value = -2147483648; // 0xFFFFFFFF80000000;
    Expect.equals(-2147483648, p1.value);
    p1.value = 0x7FFFFFFFFFFFFFFF;
    Expect.equals(0x7FFFFFFFFFFFFFFF, p1.value);
    p1.value = 0xFFFFFFFFFFFFFFFF;
    Expect.equals(-1, p1.value);
    p1.value = 0x8000000000000000; //-9223372036854775808
    Expect.equals(-9223372036854775808, p1.value);
  } finally {
    calloc.free(p1);
  }
}
