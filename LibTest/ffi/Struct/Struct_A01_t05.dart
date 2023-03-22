// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Struct subclass declaration must
/// either have type int or double and be annotated with a NativeType
/// representing the native type, or must be of type Pointer or subtype of
/// Struct or Union.
///
/// @description Checks that it is a compile error if any of the field in Struct
/// subclass is not 'int', 'double' or 'Pointer' or subtype of 'Struct' or
/// 'Union'
/// @author sgrekhov@unipro.ru
/// @issue 44985

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";

final class S1 extends Struct {
  @Int8()
  external int i;

  @Double()
  external Double x;
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @Int32()
  external Int32 y;
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class S2 extends Struct {
  @Int8()
  external int i;

  Struct? s;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class S3 extends Struct {
  @Int8()
  external int i;

  Union? u;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  S1? s1;
  S2? s2;
  S3? s3;
}
