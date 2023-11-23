// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C unsigned short type.
///
/// Typically an unsigned 16-bit integer. For a guaranteed 16-bit integer, use
/// [Uint16] with the C uint16_t type. For a signed short, use [Short].
///
/// The [UnsignedShort] type is a native type, and should not be constructed in
/// Dart code. It occurs only in native type signatures and as annotation on
/// [Struct] and [Union] fields.
///
/// @description Checks that this type represents C short type
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<UnsignedShort> p1 = calloc<UnsignedShort>();
  Pointer<Int16> p2 = new Pointer<Int16>.fromAddress(p1.address);
  try {
    p2.value = 42;
    Expect.equals(42, p1.value);
    p2.value = -42;
    Expect.equals(65494, p1.value);
    p2.value = 256;
    Expect.equals(256, p1.value);
    p2.value = 0x7FFF; // 32767
    Expect.equals(32767, p1.value);
    p2.value = 0x8000; // 32768
    Expect.equals(32768, p1.value);
    p2.value = -32768;
    Expect.equals(32768, p1.value);
    p2.value = -32769;
    Expect.equals(32767, p1.value);
  } finally {
    calloc.free(p1);
  }
}
