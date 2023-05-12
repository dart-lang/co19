// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ArrayArray<T extends NativeType> extension Null safety
//. Bounds checking indexing methods on Arrays of Array.
///
/// @description Checks that this extension contains bounds checking indexing
/// methods on Arrays of Array
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

final class MyStruct extends Struct {
  @Array(2, 3)
  external Array<Array<Int16>> a0;
  @Array.multi([2, 3])
  external Array<Array<Int16>> a1;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    final array = pointer.ref.a0;
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        array[i][j] = 42;
        Expect.equals(42, array[i][j]);
      }
    }
    final array2 = pointer.ref.a1;
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        array2[i][j] = 42;
        Expect.equals(42, array2[i][j]);
      }
    }
  } finally {
    calloc.free(pointer);
  }
}
