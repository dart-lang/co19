// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int value
/// The 16-bit two's complement integer at address.
///
/// A Dart integer is truncated to 16 bits (as if by .toSigned(16)) before being
/// stored, and the 16-bit value is sign-extended when it is loaded.
///
/// @description Check that a Dart integer is truncated to 16 bits (as if by
/// .toSigned(16)) before being stored, and the 8-bit value is sign-extended
/// when it is loaded.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int16> p = calloc<Int16>();
  try {
    Expect.equals(0, p.value);
    p.value = 500000;
    Expect.equals(500000.toSigned(16), p.value);
    p.value = -500000;
    Expect.equals(-500000.toSigned(16), p.value);
  } finally {
    calloc.free(p);
  }
}
