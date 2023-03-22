// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Union subclass declaration must
/// either have type int or float and be annotated with a NativeType
/// representing the native type, or must be of type Pointer or subtype of
/// Struct or Union.
///
/// @description Checks that it is a compile error if any of the field in Union
/// subclass is not 'int', 'double', 'Pointer' or subtype of Struct or Union
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";

final class U1 extends Union {
  @Int8()
  external int i;

  @Double()
  external List<double> x;
//         ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @Int32()
  external List<int> y;
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class U2 extends Union {
  @Int8()
  external int i;

  NativeType p;
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class U3 extends Union {
  @Int8()
  external int i;

  external NativeType p;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class U4 extends Union {
  @Int8()
  external int i;

  @Int8()
  external NativeType p;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  U1? u1;
  U2? u2;
  U3? u3;
  U4? u4;
}
