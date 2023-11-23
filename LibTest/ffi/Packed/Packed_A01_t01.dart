// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Annotation to specify on Struct subtypes to indicate that its
/// members need to be packed.
///
/// Valid values for memberAlignment are 1, 2, 4, 8, and 16.
///
/// @description Checks that valid values for memberAlignment are 1, 2, 4, 8,
/// and 16 only
/// @Issue 45838
/// @author sgrekhov@unipro.ru

import "dart:ffi";

  @Packed(-1)
//^^^^^^^^^^^
// [analyzer] unspecified
final class S1 extends Struct {
//          ^
// [cfe] unspecified
  @Double()
  external double x;
  @Int32()
  external int y;
}

  @Packed(0)
//^^^^^^^^^^
// [analyzer] unspecified
final class S2 extends Struct {
//          ^
// [cfe] unspecified
  @Double()
  external double x;
  @Int32()
  external int y;
}

  @Packed(3)
//^^^^^^^^^^
// [analyzer] unspecified
final class S3 extends Struct {
//          ^
// [cfe] unspecified
  @Double()
  external double x;
  @Int32()
  external int y;
}

void main() {
  S1? s1;
  S2? s2;
  S3? s3;
}
