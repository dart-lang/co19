// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C signed char type.
///
/// Typically a signed 8-bit integer. For a guaranteed 8-bit integer, use [Int8]
/// with the C int8_t type. For an unsigned char, use [UnsignedChar].
///
/// The [SignedChar] type is a native type, and should not be constructed in
/// Dart code. It occurs only in native type signatures and as annotation on
/// [Struct] and [Union] fields.
///
/// @description Checks that this type represents C signed char type.
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<SignedChar> p1 = calloc<SignedChar>();
  try {
    p1.value = 48;
    Expect.equals(48, p1.value);
    p1.value = -42;
    Expect.equals(-42, p1.value);
  } finally {
    calloc.free(p1);
  }
}
