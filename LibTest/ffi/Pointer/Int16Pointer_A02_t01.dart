// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void operator []=(int index, int value)
/// The 16-bit two's complement integer at address + 2 * index.
///
/// A Dart integer is truncated to 16 bits (as if by .toSigned(16)) before being
/// stored, and the 16-bit value is sign-extended when it is loaded.
///
/// @description Check that operator []=(int index, int value) sets int at
/// address + 2 * index.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int16> p1 = calloc<Int16>(2);
  try {
    Pointer<Int16> p2 = new Pointer.fromAddress(p1.address + sizeOf<Int16>());
    p1[0] = 1;
    p1[1] = 42;
    Expect.equals(1, p1[0]);
    Expect.equals(42, p1[1]);
    Expect.equals(42, p2.value);
  } finally {
    calloc.free(p1);
  }
}
