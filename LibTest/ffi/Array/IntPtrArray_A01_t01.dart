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
/// @description Checks that this class represents a fixed-size array of IntPtr
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

final class MyStruct extends Struct {
  @Array(2)
  external Array<IntPtr> a0;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    final array = pointer.ref.a0;
    for (int i = 0; i < 2; i++) {
      Expect.equals(0, array[i]);
      array[i] = 42;
      Expect.equals(42, array[i]);
      array[i] = -42;
      Expect.equals(-42, array[i]);
      array[i] = 256;
      Expect.equals(256, array[i]);
      array[i] = 32767;
      Expect.equals(32767, array[i]);
      if (sizeOf<IntPtr>() == 4) {
        array[i] = 32768;
        Expect.equals(-32768, array[i]);
        array[i] = -32768;
        Expect.equals(-32768, array[i]);
        array[i] = -32769;
        Expect.equals(32767, array[i]);
      } else {
        array[i] = 32768;
        Expect.equals(32768, array[i]);
        array[i] = -32769;
        Expect.equals(-32769, array[i]);
      }
    }
  } finally {
    calloc.free(pointer);
  }
}
