/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Represents a native signed 8 bit integer in C.
 *
 * @description Checks that this type represents a native signed 8 bit integer
 * in C.
 * @author sgrekhov@unipro.ru
 */
import "dart:ffi";
import "../ffi_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Int8> p1 = calloc<Int8>();
  try {
    Expect.equals(0, p1.value);
    p1.value = 42;
    Expect.equals(42, p1.value);
    p1.value = -42;
    Expect.equals(-42, p1.value);
    p1.value = 127;
    Expect.equals(127, p1.value);
    p1.value = 128;
    Expect.equals(-128, p1.value);
    p1.value = -127;
    Expect.equals(-127, p1.value);
    p1.value = -128;
    Expect.equals(-128, p1.value);
    p1.value = -129;
    Expect.equals(127, p1.value);
  } finally {
    calloc.free(p1);
  }
}
