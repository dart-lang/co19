// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int operator [](int index)
///
/// The 64-bit two's complement integer at address + 8 * index.
///
/// @description Check that a Dart integer is not truncated before being stored
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int64> p1 = calloc<Int64>(2);
  try {
    Pointer<Int64> p2 = new Pointer.fromAddress(p1.address + sizeOf<Int64>());
    p1.value = 0x7FFFFFFFFFFFFFFF;
    p2.value = 0xFFFFFFFFFFFFFFFF;
    Expect.equals(0x7FFFFFFFFFFFFFFF, p1[0]);
    Expect.equals(0xFFFFFFFFFFFFFFFF, p1[1]);
  } finally {
    calloc.free(p1);
  }
}
