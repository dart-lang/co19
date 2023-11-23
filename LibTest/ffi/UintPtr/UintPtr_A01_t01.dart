// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C uintptr_t type.
///
/// The [UintPtr] type is a native type, and should not be constructed in Dart
/// code. It occurs only in native type signatures and as annotation on [Struct]
/// and [Union] fields.
///
/// @description Checks that this represents C uintptr_t type
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<UintPtr> p1 = calloc<UintPtr>();
  try {
    p1.value = 42;
    Expect.equals(42, p1.value);
    p1.value = 256;
    Expect.equals(256, p1.value);
    p1.value = 32767;
    Expect.equals(32767, p1.value);
    p1.value = 32768;
    Expect.equals(32768, p1.value);
    p1.value = 0x7FFFFFFF;
    Expect.equals(2147483647, p1.value);
    if (sizeOf<UintPtr>() == 4) { // 32-bit
      p1.value = -42;
      Expect.equals((-42).toUnsigned(32), p1.value);
      p1.value = -32769;
      Expect.equals((-32769).toUnsigned(32), p1.value);
      p1.value = 0x80000000;
      Expect.equals(2147483648, p1.value);
      p1.value = 0x100000000;
      Expect.equals(0, p1.value);
    } else { // 64-bit
      p1.value = -42;
      Expect.equals(-42, p1.value);
      p1.value = -32769; // 0xFFFF 7FFF
      Expect.equals(-32769, p1.value);
    }
  } finally {
    calloc.free(p1);
  }
}
