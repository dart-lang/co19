// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C unsigned char type.
///
/// Typically an unsigned 8-bit integer. For a guaranteed 8-bit integer, use
/// [Uint8] with the C uint8_t type. For a signed char, use [SignedChar].
///
/// The [UnsignedChar] type is a native type, and should not be constructed in
/// Dart code. It occurs only in native type signatures and as annotation on
/// [Struct] and [Union] fields.
///
/// @description Checks that this type represents C unsigned char type.
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<UnsignedChar> p1 = calloc<UnsignedChar>();
  Pointer<Int8> p2 = new Pointer<Int8>.fromAddress(p1.address);
  try {
    p2.value = 0;
    Expect.equals(0, p1.value);
    p2.value = 1;
    Expect.equals(1, p1.value);
    p2.value = 127;
    Expect.equals(127, p1.value);
    p2.value = 128;
    Expect.equals(128, p1.value);
    p2.value = 255;
    Expect.equals(255, p1.value);
    p2.value = 256;
    Expect.equals(0, p1.value);
  } finally {
    calloc.free(p1);
  }
}
