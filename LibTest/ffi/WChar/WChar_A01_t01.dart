// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C wchar_t type.
///
/// The signedness of wchar_t is undefined in C. Here, it is exposed as the
/// defaults on the tested Abis.
///
/// The [WChar] type is a native type, and should not be constructed in Dart
/// code. It occurs only in native type signatures and as annotation on [Struct]
/// and [Union] fields.
///
/// @description Checks that this type represents a C wchar_t type
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<WChar> p1 = calloc<WChar>();
  try {
    p1.value = 48;
    Expect.equals(48, p1.value);
    p1.value = -42;
    Expect.isTrue(65494 == p1.value || -42 == p1.value);
  } finally {
    calloc.free(p1);
  }
}
