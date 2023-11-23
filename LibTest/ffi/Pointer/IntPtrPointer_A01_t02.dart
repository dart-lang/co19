// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int operator [](int index)
///
/// The 32 or 64-bit two's complement integer at address +
/// (4 or 8) * index.
///
/// On 32-bit platforms this is a 32-bit integer, and on 64-bit platforms this
/// is a 64-bit integer.
///
/// On 32-bit platforms a Dart integer is truncated to 32 bits (as if by
/// .toSigned(32)) before being stored, and the 32-bit value is sign-extended
/// when it is loaded.
///
/// On 32-bit platforms the address must be 4-byte aligned, and on 64-bit
/// platforms the address must be 8-byte aligned.
///
/// @description Check that on 32-bit platforms a Dart integer is truncated to
/// 32 bits and on 64-bit platforms a Dart integer is not truncated before being
/// stored
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<IntPtr> p1 = calloc<IntPtr>(2);
  try {
    Pointer<IntPtr> p2 = new Pointer.fromAddress(p1.address + sizeOf<IntPtr>());
    if (sizeOf<IntPtr>() == 4) {
      p1.value = 5000000000;
      p2.value = -5000000000;
      Expect.equals(5000000000.toSigned(32), p1[0]);
      Expect.equals(-5000000000.toSigned(32), p1[1]);
    } else {
      p1.value = 0x7FFFFFFFFFFFFFFF;
      p2.value = 0xFFFFFFFFFFFFFFFF;
      Expect.equals(0x7FFFFFFFFFFFFFFF, p1[0]);
      Expect.equals(0xFFFFFFFFFFFFFFFF, p1[1]);
    }
  } finally {
    calloc.free(p1);
  }
}
