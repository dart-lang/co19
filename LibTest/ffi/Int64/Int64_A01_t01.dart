// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Represents a native signed 64 bit integer in C.
///
/// @description Checks that this type represents a native signed 64 bit integer
/// in C.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Int64> p1 = calloc<Int64>();
  try {
    p1.value = 42;
    Expect.equals(42, p1.value);
    p1.value = -42;
    Expect.equals(-42, p1.value);
    p1.value = 32768;
    Expect.equals(32768, p1.value);
    p1.value = -32768;
    Expect.equals(-32768, p1.value);
    p1.value = 2147483648;
    Expect.equals(2147483648, p1.value);
    p1.value = -2147483649;
    Expect.equals(-2147483649, p1.value);
    p1.value = 0x7FFFFFFFFFFFFFFF;
    Expect.equals(9223372036854775807, p1.value);
    p1.value = 0xFFFFFFFFFFFFFFFF;
    Expect.equals(-1, p1.value);
    p1.value = -9223372036854775808;
    Expect.equals(-9223372036854775808, p1.value);
  } finally {
    calloc.free(p1);
  }
}
