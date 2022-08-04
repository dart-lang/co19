// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C size_t type.
///
/// The [Size] type is a native type, and should not be constructed in Dart
/// code. It occurs only in native type signatures and as annotation on [Struct]
/// and [Union] fields.
///
/// @description Checks that this type represents C size_t type and is big
/// enough to contain the size of the biggest object the host system can handle
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Size> p1 = calloc<Size>();
  try {
    p1.value = 42;
    Expect.equals(42, p1.value);
    p1.value = -42;
    Expect.equals(-42, p1.value);
    p1.value = 0xFFFFFFFF; // max 32-bit
    Expect.equals(0xFFFFFFFF, p1.value);
    if (sizeOf<IntPtr>() == 8) {  // 64-bit system
      p1.value = 0xFFFFFFFFFFFFFFFF;
      Expect.equals(0xFFFFFFFFFFFFFFFF, p1.value);
    }
  } finally {
    calloc.free(p1);
  }
}
