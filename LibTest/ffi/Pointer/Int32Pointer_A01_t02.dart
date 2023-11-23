// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int operator [](int index)
///
/// The 32-bit two's complement integer at address + 4 * index.
///
/// A Dart integer is truncated to 32 bits (as if by .toSigned(32)) before being
/// stored, and the 32-bit value is sign-extended when it is loaded.
///
/// @description Check that a Dart integer is truncated to 32 bits (as if by
/// .toSigned(32)) before being stored, and the 32-bit value is sign-extended
/// when it is loaded.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int32> p1 = calloc<Int32>(2);
  try {
    Pointer<Int32> p2 = new Pointer.fromAddress(p1.address + sizeOf<Int32>());
    p1.value = 5000000000;
    p2.value = -5000000000;
    Expect.equals(5000000000.toSigned(32), p1[0]);
    Expect.equals(-5000000000.toSigned(32), p1[1]);
  } finally {
    calloc.free(p1);
  }
}
