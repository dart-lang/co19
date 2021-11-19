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
/// @description Checks that it is a compile time error if Array type is not
/// subtype of [NativeType]
/// @author sgrekhov@unipro.ru

import 'dart:ffi';

class MyStruct extends Struct {
  @Array.multi([16])
  external Array<String> a1;
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @Array.multi([16])
  external Array<void> a2;
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @Array.multi([16])
  external Array<dynamic> a3;
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @Array.multi([16])
  external Array<Null> a4;
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  MyStruct? ms;
}
