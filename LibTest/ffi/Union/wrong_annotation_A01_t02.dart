// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Union subclass declaration must
/// either have type int or float and be annotated with a NativeType
/// representing the native type, or must be of type Pointer.
//
/// @description Checks that it is a compile error if double field is annotated
/// as UIntX
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";

final class U1 extends Union {
  @Uint8()
//^^^^^^^^
// [analyzer] unspecified
  external double x;
//                ^
// [cfe] unspecified
}

final class U2 extends Union {
  @Uint16()
//^^^^^^^^^
// [analyzer] unspecified
  external double x;
//                ^
// [cfe] unspecified
}

final class U3 extends Union {
  @Uint32()
//^^^^^^^^^
// [analyzer] unspecified
  external double x;
//                ^
// [cfe] unspecified
}

final class U4 extends Union {
  @Uint64()
//^^^^^^^^^
// [analyzer] unspecified
  external double x;
//                ^
// [cfe] unspecified
}

void main() {
  U1? u1;
  U2? u2;
  U3? u3;
  U4? u4;
}
