// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// const Array<T extends NativeType>(
/// int dimension1,
///  [int dimension2,
///  int dimension3,
///  int dimension4,
///  int dimension5]
///  )
///  Const constructor to specify Array dimensions in Structs.
///
///  class MyStruct extends Struct {
///  @Array(8)
///  external Array<Uint8> inlineArray;
///
///  @Array(2, 2, 2)
///  external Array<Array<Array<Uint8>>> threeDimensionalInlineArray;
///  }
///  Do not invoke in normal code.
///
/// @description Checks that Array(1, 2, 3) is the same as Array.multi([1, 2, 3])
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

final class MyStruct1 extends Struct {
  @Array(1, 2, 3)
  external Array<Array<Array<Uint8>>> a0;
}

final class MyStruct2 extends Struct {
  @Array.multi([1, 2, 3])
  external Array<Array<Array<Uint8>>> a0;
}

void main() {
  final pointer1 = calloc<MyStruct1>();
  final pointer2 = calloc<MyStruct2>();
  try {
    var array1 = pointer1.ref.a0;
    var array2 = pointer2.ref.a0;
    pointer2.ref.a0 = array1;
    pointer1.ref.a0 = array2;
  } finally {
    calloc.free(pointer1);
    calloc.free(pointer2);
  }
}
