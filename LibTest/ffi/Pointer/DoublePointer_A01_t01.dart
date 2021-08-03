// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion double operator [](int index)
/// The double at address + 8 * index.
///
/// The address must be 8-byte aligned.
///
/// @description Check that operator [](int index) returns double at
/// address + 8 * index.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Double> p1 = calloc<Double>(2);
  try {
    Pointer<Double> p2 = new Pointer.fromAddress(p1.address + sizeOf<Double>());
    p1.value = 1.1;
    p2.value = 3.14;
    Expect.equals(1.1, p1[0]);
    Expect.equals(3.14, p1[1]);
  } finally {
    calloc.free(p1);
  }
}
