// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A getter definition that is prefixed with the static modifier 
/// defines a static getter
/// @description Checks that non-static getter cannot be called as static one.
/// Compile error occurs
/// @author sgrekhov@unipro.ru


class C1 {
  int get g1 => 0;
  get g2 => null;
}

class C2 extends C1 {
  int get g3 => 0;
}

main() {
  C1.g1;
//   ^^
// [analyzer] COMPILE_TIME_ERROR.STATIC_ACCESS_TO_INSTANCE_MEMBER
// [cfe] Member not found: 'g1'.
  C1.g2;
//   ^^
// [analyzer] COMPILE_TIME_ERROR.STATIC_ACCESS_TO_INSTANCE_MEMBER
// [cfe] Member not found: 'g2'.
  C2.g1;
//   ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_GETTER
// [cfe] Member not found: 'g1'.
  C2.g2;
//   ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_GETTER
// [cfe] Member not found: 'g2'.
  C2.g3;
//   ^^
// [analyzer] COMPILE_TIME_ERROR.STATIC_ACCESS_TO_INSTANCE_MEMBER
// [cfe] Member not found: 'g3'.
}
