// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int operator [](int index)
/// The int at address + 8 * index.
///
/// The 32-bit two's complement integer at address + 8 * index.
///
/// @description Check that operator [](int index) returns int at
/// address + 8 * index.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int64> p1 = calloc<Int64>(2);
  try {
    Pointer<Int64> p2 = new Pointer.fromAddress(p1.address + sizeOf<Int64>());
    p1.value = 1;
    p2.value = 42;
    Expect.equals(1, p1[0]);
    Expect.equals(42, p1[1]);
  } finally {
    calloc.free(p1);
  }
}
