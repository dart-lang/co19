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
/// @description Checks that it is a compile time error if Array type is not
/// subtype of [NativeType]
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import 'dart:ffi';

final class MyStruct extends Struct {
  @Array(16)
  external Array<int> a1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  @Array(16)
  external Array<double> a2;
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @Array(16)
  external Array<num> a3;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  MyStruct? ms;
}
