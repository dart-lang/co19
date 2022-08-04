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
  Pointer<Uint16> p1 = calloc<Uint16>(2);
  try {
    Expect.equals(2, p1.elementAt(1).address - p1.address);
    Expect.equals(2, sizeOf<Uint16>());
  } finally {
    calloc.free(p1);
  }
}
