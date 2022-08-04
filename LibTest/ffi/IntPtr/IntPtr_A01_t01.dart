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
    p1.value = 42;
    Expect.equals(42, p1.value);
    p1.value = -42;
    Expect.equals(-42, p1.value);
    p1.value = 256;
    Expect.equals(256, p1.value);
    p1.value = 32767;
    Expect.equals(32767, p1.value);
    p1.value = 32768;
    Expect.equals(32768, p1.value);
    p1.value = -32769;
    Expect.equals(-32769, p1.value);
    p1.value = 0x7FFFFFFF;
    Expect.equals(2147483647, p1.value);
    if (sizeOf<IntPtr>() == 4) {
      p1.value = 0x80000000;
      Expect.equals(-2147483648, p1.value);
      p1.value = -2147483649;
      Expect.equals(2147483647, p1.value);
    }
  } finally {
    calloc.free(p1);
  }
}
