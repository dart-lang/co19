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
  Pointer<UnsignedChar> p1 = calloc<UnsignedChar>(2);
  try {
    Expect.equals(1, p1.elementAt(1).address - p1.address);
    Expect.equals(1, sizeOf<UnsignedChar>());
  } finally {
    calloc.free(p1);
  }
}
