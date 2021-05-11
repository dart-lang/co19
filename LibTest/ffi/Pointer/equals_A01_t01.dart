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

void main() {
  Pointer<Int8> p1 = calloc<Int8>();
  Pointer<Int8> p2 = calloc<Int8>();
  try {
    Expect.isFalse(p1 == p2);
    Expect.isTrue(p1 != p2);
    Pointer<Int8> p3 = new Pointer.fromAddress(p1.address);
    Expect.isTrue(p1 == p3);
  } finally {
    calloc.free(p1);
    calloc.free(p2);
  }
}
