// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C char type.
///
/// Typically a signed or unsigned 8-bit integer. For a guaranteed 8-bit
/// integer, use [Int8] with the C int8_t type or [Uint8] with the C uint8_t
/// type.
/// For a specifically signed or unsigned char, use [SignedChar] or
/// [UnsignedChar].
///
/// The Char type is a native type, and should not be constructed in Dart code.
/// It occurs only in native type signatures and as annotation on [Struct] and
/// [Union] fields.
///
/// @description Checks that this type represents a native char in C.
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Char> p1 = calloc<Char>();
  Pointer<Uint8> p2 = new Pointer<Uint8>.fromAddress(p1.address);
  try {
    p2.value = 0;
    Expect.equals(0, p1.value);
    p2.value = 1;
    Expect.equals(1, p1.value);
    p2.value = 127;
    Expect.equals(127, p1.value);
    p2.value = 256;
    Expect.equals(0, p1.value);
  } finally {
    calloc.free(p1);
  }
}
