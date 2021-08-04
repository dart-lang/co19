// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void operator []=(int index, Pointer<T> value)
/// Store a Dart value into this location offset by index.
///
// A Pointer is unboxed before being stored (as if by .address), and the pointer
// is boxed (as if by Pointer.fromAddress) when loaded.
///
/// @description Check that operator []=(int index, Pointer<T> value) returns
/// a Dart value from this location offset by index.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Arena alloc = Arena();
  Pointer<Pointer<Double>> p1 = alloc<Pointer<Double>>(2);
  p1[0] = alloc<Double>();
  p1[0].value = 1;
  p1[1] = alloc<Double>();
  p1[1].value = 42;
  try {
    Pointer<Pointer<Double>> p2 =
        new Pointer.fromAddress(p1.address + sizeOf<Pointer<Double>>());
    Expect.equals(1, p1[0].value);
    Expect.equals(42, p1[1].value);
    Expect.equals(p2.value, p1[1]);
    Expect.equals(p2.value.value, p1[1].value);
    Expect.equals(p2.value.address, p1[1].address);
  } finally {
    alloc.releaseAll();
  }
}
