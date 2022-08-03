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
    if (sizeOf<UintPtr>() == 4) {
      Pointer<IntPtr> p2 = new Pointer<IntPtr>.fromAddress(p1.address);
      p2.value = 42;
      Expect.equals(42, p1.value);
      p2.value = -42;
      Expect.equals(-42, p1.value);
      p2.value = 32768;
      Expect.equals(32768, p1.value);
      p2.value = -32768;
      Expect.equals(-32768, p1.value);
      p2.value = 0x7FFFFFFF;
      Expect.equals(2147483647, p1.value);
      p2.value = 2147483648;
      Expect.equals(-2147483648, p1.value);
      p2.value = -2147483649;
      Expect.equals(2147483647, p1.value);
    } else {
      Pointer<Int64> p2 = new Pointer<Int64>.fromAddress(p1.address);
      Expect.equals(0, p1.value);
      p2.value = 42;
      Expect.equals(42, p1.value);
      p2.value = -42;
      Expect.equals(-42, p1.value);
      p2.value = 32768;
      Expect.equals(32768, p1.value);
      p2.value = -32768;
      Expect.equals(-32768, p1.value);
      p2.value = 2147483648;
      Expect.equals(2147483648, p1.value);
      p2.value = -2147483649;
      Expect.equals(-2147483649, p1.value);
      p2.value = 0x7FFFFFFFFFFFFFFF;
      Expect.equals(9223372036854775807, p1.value);
      p2.value = 0xFFFFFFFFFFFFFFFF;
      Expect.equals(-1, p1.value);
      p2.value = -9223372036854775808;
      Expect.equals(-9223372036854775808, p1.value);
    }
  } finally {
    calloc.free(p1);
  }
}
