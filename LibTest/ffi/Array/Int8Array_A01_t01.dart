// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int8Array extension Null safety
/// Bounds checking indexing methods on Arrays of Int8.
///
/// @description Checks that this extension contains bounds checking indexing
/// methods on Arrays of Int8
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

final class MyStruct extends Struct {
  @Array(2)
  external Array<Int8> a0;
  @Array.multi([2, 3])
  external Array<Array<Int8>> a1;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    final array1 = pointer.ref.a0;
    for (int i = 0; i < 2; i++) {
      array1[i] = 42;
      Expect.equals(42, array1[i]);
      array1[i] = -42;
      Expect.equals(-42, array1[i]);
    }
    final array2 = pointer.ref.a1;
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 3; j++) {
        array2[i][j] = 42;
        Expect.equals(42, array2[i][j]);
        array2[i][j] = -42;
        Expect.equals(-42, array2[i][j]);
      }
    }
  } finally {
    calloc.free(pointer);
  }
}
