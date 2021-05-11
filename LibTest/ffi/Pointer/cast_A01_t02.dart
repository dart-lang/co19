// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<U> cast <U extends NativeType>()
///  Cast Pointer to a Pointer.
///
/// @description Checks that this method casts Pointer to a Pointer
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int8> p1 = calloc<Int8>();
  try {
    Pointer<Int16> p2 = new Pointer.fromAddress(p1.address);
    p2.value = 256;
    Expect.equals(0, p1.value);
    var p3 = p2.cast<Int8>();
    Expect.equals(0, p3.value);
  } finally {
    calloc.free(p1);
  }
}
