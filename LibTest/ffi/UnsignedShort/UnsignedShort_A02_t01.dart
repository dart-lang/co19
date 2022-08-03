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
/// @description Checks that this type is a unsigned 16-bit integer
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<UnsignedShort> p1 = calloc<UnsignedShort>(2);
  try {
    Expect.equals(2, p1.elementAt(1).address - p1.address);
    Expect.equals(2, sizeOf<UnsignedShort>());
  } finally {
    calloc.free(p1);
  }
}
