// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void operator []=(int index, int value)
/// The 8-bit two's complement integer at address + index.
///
/// A Dart integer is truncated to 8 bits (as if by .toSigned(8)) before being
/// stored, and the 8-bit value is sign-extended when it is loaded.
///
/// @description Check that a Dart integer is truncated to 8 bits (as if by
/// .toSigned(8)) before being stored, and the 8-bit value is sign-extended when
/// it is loaded.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int8> p1 = calloc<Int8>(2);
  try {
    Pointer<Int8> p2 = new Pointer.fromAddress(p1.address + sizeOf<Int8>());
    p1[0] = 300;
    p1[1] = -300;
    Expect.equals(300.toSigned(8), p1[0]);
    Expect.equals(-300.toSigned(8), p1[1]);
    Expect.equals(-300.toSigned(8), p2.value);
  } finally {
    calloc.free(p1);
  }
}
