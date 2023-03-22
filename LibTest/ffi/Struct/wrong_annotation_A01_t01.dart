// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Struct subclass declaration must
/// either have type int or float and be annotated with a NativeType representing
/// the native type, or must be of type Pointer.
///
/// @description Checks that it is a compile error if double field is annotated
/// as IntX
/// @author sgrekhov@unipro.ru

import "dart:ffi";

final class S1 extends Struct {
  @Int8()
//^^^^^^^
// [analyzer] unspecified
  external double x;
//                ^
// [cfe] unspecified
}

final class S2 extends Struct {
  @Int16()
//^^^^^^^^
// [analyzer] unspecified
  external double x;
//                ^
// [cfe] unspecified
}

final class S3 extends Struct {
  @Int32()
//^^^^^^^^
// [analyzer] unspecified
  external double x;
//                ^
// [cfe] unspecified
}

final class S4 extends Struct {
  @Int64()
//^^^^^^^^
// [analyzer] unspecified
  external double x;
//                ^
// [cfe] unspecified
}

void main() {
  S1? s1;
  S2? s2;
  S3? s3;
  S4? s4;
}
