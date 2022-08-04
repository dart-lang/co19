// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Represents a native unsigned 32 bit integer in C.
///
/// @description Checks that this type represents a native unsigned 32 bit
/// integer in C.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Uint32> p1 = calloc<Uint32>();
  Pointer<Uint64> p2 = new Pointer<Uint64>.fromAddress(p1.address);
  try {
    p2.value = 1;
    // Test works for little endian encoding of the number only
    if (p1.value != 0) {
      p2.value = 256;
      Expect.equals(256, p1.value);
      p2.value = 32768;
      Expect.equals(32768, p1.value);
      p2.value = 65536;
      Expect.equals(65536, p1.value);
      p2.value = 4294967295;
      Expect.equals(4294967295, p1.value);
      p2.value = 4294967296;
      Expect.equals(0, p1.value);
      p2.value = -1;
      Expect.equals(4294967295, p1.value);
    }
  } finally {
    calloc.free(p1);
  }
}
