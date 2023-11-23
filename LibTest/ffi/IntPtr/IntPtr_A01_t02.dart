// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Represents a native pointer-sized integer in C.
///
/// @description Checks that this represents a native pointer-sized integer in C.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<IntPtr> p1 = calloc<IntPtr>();
  try {
    if (sizeOf<IntPtr>() == 4) {
      Pointer<Int32> p2 = new Pointer<Int32>.fromAddress(p1.address);
      p2.value = 42;
      Expect.equals(42, p1.value);
      p2.value = -42;
      Expect.equals(-42, p1.value);
      p2.value = 32768;
      Expect.equals(32768, p1.value);
      p2.value = -32768;
      Expect.equals(-32768, p1.value);
      p2.value = 2147483647;
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
