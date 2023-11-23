// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion double value
/// The double at address.
///
/// The address must be 8-byte aligned.
///
/// @description Check that this getter/setter works as designed
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Double> p = calloc<Double>();
  try {
    Expect.equals(0, p.value);
    p.value = 3.14;
    Expect.equals(3.14, p.value);
  } finally {
    calloc.free(p);
  }
}
