// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int32List asTypedList(int length)
/// Creates a typed list view backed by memory in the address space.
///
/// The returned view will allow access to the memory range from address to
/// address + 4 * length.
///
/// The user has to ensure the memory range is accessible while using the
/// returned list.
///
/// @description Check that this method returns a typed list view backed by
/// memory in the address space.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import 'dart:typed_data';
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int32> p = calloc<Int32>(3);
  try {
    p[0] = 3;
    p[1] = 42;
    p[2] = -1;
    Int32List l = p.asTypedList(3);
    Expect.equals(3, l[0]);
    Expect.equals(42, l[1]);
    Expect.equals(-1, l[2]);
  } finally {
    calloc.free(p);
  }
}
