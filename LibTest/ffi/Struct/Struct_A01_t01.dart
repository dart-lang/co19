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

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";

final class S1 extends Struct {
  @Double()
  external double x;
  @Int32()
  external int y;
  @Int8()
  external num z;
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class S2 extends Struct {
  @Double()
  external double x;
  @Int32()
  external int y;

  String? s;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class S3 extends Struct {
  @Double()
  external double x;
  @Int32()
  external int y;

  external String? s;
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class S4 extends Struct {
  @Double()
  external double x;
  @Int32()
  external int y;
  @Int16()
  external String? s;
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class S5 extends Struct {
  @Double()
  external double x;
  @Int32()
  external int y;

  external bool? b;
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class S6 extends Struct {
  @Double()
  external double x;
  @Int32()
  external int y;

  bool? b;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  S1? s1;
  S2? s2;
  S3? s3;
  S4? s4;
  S5? s5;
  S6? s6;
}
