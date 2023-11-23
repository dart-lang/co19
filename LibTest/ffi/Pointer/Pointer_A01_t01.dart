// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T extends NativeType>
///  Represents a pointer into the native C memory. Cannot be extended.
///
/// @description Checks that this class cannot be extended
/// @author sgrekhov@unipro.ru

import "dart:ffi";

abstract class C1<T extends NativeType> extends Pointer<T> {
//                                              ^^^^^^^^^^
// [cfe] unspecified
// [analyzer] unspecified
}

abstract class C2 extends Pointer<Int8> {
//                        ^^^^^^^^^^^^^
// [cfe] unspecified
// [analyzer] unspecified
}

abstract class C3 implements Pointer<Int8> {
//                           ^^^^^^^^^^^^^
// [cfe] unspecified
// [analyzer] unspecified
}

void main() {
  C1? c1;
  C2? c2;
  C3? c3;
}
