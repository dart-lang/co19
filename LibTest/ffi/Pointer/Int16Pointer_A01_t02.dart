// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int operator [](int index)
///
/// The 16-bit two's complement integer at address + 2 * index.
///
/// A Dart integer is truncated to 16 bits (as if by .toSigned(16)) before being
/// stored, and the 16-bit value is sign-extended when it is loaded.
///
/// @description Check that a Dart integer is truncated to 16 bits (as if by
/// .toSigned(16)) before being stored, and the 16-bit value is sign-extended
/// when it is loaded.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int16> p1 = calloc<Int16>(2);
  try {
    Pointer<Int16> p2 = new Pointer.fromAddress(p1.address + sizeOf<Int16>());
    p1.value = 500000;
    p2.value = -500000;
    Expect.equals(500000.toSigned(16), p1[0]);
    Expect.equals(-500000.toSigned(16), p1[1]);
  } finally {
    calloc.free(p1);
  }
}
