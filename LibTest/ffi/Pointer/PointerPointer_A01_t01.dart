// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T> operator [](int index)
/// Load a Dart value from this location offset by index.
///
// A Pointer is unboxed before being stored (as if by .address), and the pointer
// is boxed (as if by Pointer.fromAddress) when loaded.
///
/// @description Check that operator [](int index) returns a Dart value from
/// this location offset by index.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Arena alloc = Arena();
  Pointer<Pointer<Double>> p1 = alloc<Pointer<Double>>(2);
  p1[0] = alloc<Double>();
  p1[0].value = 1;
  try {
    Pointer<Pointer<Double>> p2 =
        new Pointer.fromAddress(p1.address + sizeOf<Pointer<Double>>());
    p2.value = alloc<Double>();
    p2.value.value = 42;
    Expect.equals(p2.value, p1[1]);
    Expect.equals(p2.value.value, p1[1].value);
    Expect.equals(p2.value.address, p1[1].address);
  } finally {
    alloc.releaseAll();
  }
}
