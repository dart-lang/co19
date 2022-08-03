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
  Pointer<Uint16> p2 = new Pointer<Uint16>.fromAddress(p1.address);
  try {
    p2.value = 0;
    Expect.equals(0, p1.value);
    p2.value = 1;
    Expect.equals(1, p1.value);
    p2.value = 127;
    Expect.equals(127, p1.value);
    p2.value = 256;
    Expect.equals(256, p1.value);
    p2.value = 0x7FFF; // 32767
    Expect.equals(32767, p1.value);
    p2.value = 0xFFFF; // 65535
    Expect.equals(65535, p1.value);
    p2.value = 65536; //0x10000
    Expect.equals(0, p1.value);
    p2.value = -1;
    Expect.equals(65535, p1.value);
  } finally {
    calloc.free(p1);
  }
}
