// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool operator == (Object other)
///  override
///  Equality for Pointers only depends on their address.
///
/// @description Checks that equality for Pointers only depends on their address.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

main() {
  Pointer<Int8> p1 = calloc();
  try {
    Pointer<Int16> p2 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p2);
    Pointer<Int32> p3 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p3);
    Pointer<Int64> p4 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p4);
    Pointer<Uint8> p5 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p5);
    Pointer<Uint16> p6 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p6);
    Pointer<Uint32> p7 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p7);
    Pointer<Uint64> p8 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p8);
    Pointer<Float> p9 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p9);
    Pointer<Double> p10 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p10);
    Pointer<IntPtr> p11 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p11);
    Pointer<Pointer<Int32>> p12 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p12);
    Pointer<Array<Int32>> p13 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p13);
  } finally {
    calloc.free(p1);
  }
}
