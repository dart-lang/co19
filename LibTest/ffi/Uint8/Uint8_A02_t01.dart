// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Represents a native unsigned 8 bit integer in C.
///
/// @description Checks that this type represents a native unsigned 8 bit integer
/// in C.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Uint8> p1 = calloc<Uint8>(2);
  try {
    Expect.equals(1, p1.elementAt(1).address - p1.address);
    Expect.equals(1, sizeOf<Uint8>());
  } finally {
    calloc.free(p1);
  }
}
