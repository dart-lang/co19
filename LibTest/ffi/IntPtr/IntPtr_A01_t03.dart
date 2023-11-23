// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Represents a native pointer-sized integer in C.
///
/// @description Checks that this represents a native pointer-sized integer in C.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import 'package:ffi/ffi.dart';
import "../../../Utils/expect.dart";

void main() {
  Pointer<IntPtr> p1 = calloc<IntPtr>(3);
  try {
    if (sizeOf<IntPtr>() == 4) {
      Expect.equals(4, p1.elementAt(1).address - p1.address);
      Expect.equals(4, p1.elementAt(2).address - p1.elementAt(1).address);
    } else {
      Expect.equals(8, p1.elementAt(1).address - p1.address);
      Expect.equals(8, sizeOf<IntPtr>());
    }
  } finally {
    calloc.free(p1);
  }
}
