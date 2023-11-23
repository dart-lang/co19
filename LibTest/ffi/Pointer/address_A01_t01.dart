// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int address
///  Access to the raw pointer value. On 32-bit systems, the upper 32-bits of the
///  result are 0.
///
/// @description Checks that this getter returns the raw pointer value
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int8> p1 = calloc<Int8>();
  try {
    Expect.isTrue(p1.address != 0);
    Pointer<Int8> p2 = calloc<Int8>();
    try {
      Expect.notEquals(p1.address, p2.address);
    } finally {
      calloc.free(p2);
    }
  } finally {
    calloc.free(p1);
  }
}
