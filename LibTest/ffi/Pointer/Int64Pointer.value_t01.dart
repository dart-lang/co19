// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int value
/// The 64-bit two's complement integer at address.
///
/// @description Check that this getter/setter works as designed
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int64> p = calloc<Int64>();
  try {
    Expect.equals(0, p.value);
    p.value = 42;
    Expect.equals(42, p.value);
  } finally {
    calloc.free(p);
  }
}
