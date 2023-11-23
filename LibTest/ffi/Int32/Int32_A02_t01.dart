// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Represents a native signed 32 bit integer in C.
///
/// @description Checks that this type represents a native signed 16 bit integer
/// in C.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Int32> p1 = calloc<Int32>(2);
  try {
    Expect.equals(4, p1.elementAt(1).address - p1.address);
    Expect.equals(4, sizeOf<Int32>());
  } finally {
    calloc.free(p1);
  }
}
