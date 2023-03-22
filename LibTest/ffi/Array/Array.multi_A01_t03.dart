// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// const Array<T extends NativeType>.multi(List<int> dimensions)
///  Const constructor to specify Array dimensions in Structs.
///
///  class MyStruct extends Struct {
///  @Array.multi([2, 2, 2])
///  external Array<Array<Array<Uint8>>> threeDimensionalInlineArray;
///
/// @Array.multi([2, 2, 2, 2, 2, 2, 2, 2])
///  external Array<Array<Array<Array<Array<Array<Array<Array<Uint8>>>>>>>> eightDimensionalInlineArray;
///  }
///  Do not invoke in normal code.
///
/// @description Checks multidimentional array created by Array.multi(). Check
/// not literal argument
/// @author sgrekhov@unipro.ru
/// @issue 45537

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

const arr = [3, 1];

final class MyStruct extends Struct {
  @Array.multi(arr)
  external Array<Array<Int8>> a0;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    final array = pointer.ref.a0;

    for (int i1 = 0; i1 < 3; i1++) {
      for (int i2 = 0; i2 < 1; i2++) {
        Expect.equals(0, array[i1][i2]);
        array[i1][i2] = i1 + i2;
        Expect.equals(i1 + i2, array[i1][i2]);
      }
    }
  } finally {
    calloc.free(pointer);
  }
}
