// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T extends NativeType>.fromAddress(int ptr)
///  Construction from raw integer.
///
/// @description Checks that this constructor constructs pointer from a raw
/// integer
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int8> p1 = calloc<Int8>();
  try {
    p1.value = 42;
    Pointer<Int8> p2 = new Pointer.fromAddress(p1.address);
    Expect.equals(42, p2.value);
    Expect.equals(p1.address, p2.address);
  } finally {
    calloc.free(p1);
  }
}
