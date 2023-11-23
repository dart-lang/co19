// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Represents a native unsigned 16 bit integer in C.
///
/// @description Checks that this type represents a native unsigned 16 bit
/// integer in C.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Uint16> p1 = calloc<Uint16>();
  try {
    p1.value = 256;
    Expect.equals(256, p1.value);
    p1.value = 32768;
    Expect.equals(32768, p1.value);
    p1.value = 65535;
    Expect.equals(65535, p1.value);
    p1.value = 65536;
    Expect.equals(0, p1.value);
    p1.value = -1;
    Expect.equals(65535, p1.value);
    p1.value = -32767; //0x8000
    Expect.equals(32769, p1.value);
  } finally {
    calloc.free(p1);
  }
}
