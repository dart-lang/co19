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
/// @description Checks that it is not allowed to create zero-sized array
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";
import "package:ffi/ffi.dart";

final class MyStruct extends Struct {
  @Array(0)
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  external Array<Uint8> a0;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    pointer.ref.a0;
  } finally {
    calloc.free(pointer);
  }
}
