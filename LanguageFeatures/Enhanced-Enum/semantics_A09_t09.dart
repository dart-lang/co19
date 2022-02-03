// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the resulting class would have any naming conflicts, or other
/// compile-time errors, the enum declaration is invalid and a compile-time
/// error occurs. Such errors include, but are not limited to:
///
/// Declaring or inheriting (from Enum or from a declared mixin or interface)
/// any member with the same basename as an enum value which is not a static
/// setter. (The introduced static declarations would have a conflict.)
///
/// @description Check that it is a compile-time error to inherit any member
/// with the same basename as enum value
/// @author sgrekhov@unipro.ru
/// @issue 48295

// SharedOptions=--enable-experiment=enhanced-enums

abstract class I1 {
  final E1 e1 = E1.e2;
}

class I2 {
  final int e1 = 42;
}

class I3 {
  int get e1 => 42;
}

class I4 {
  void set e1(int v) {}
}

abstract class I5 {
  void e1();
}

class I6 {
  void e1() {}
}

enum E1 implements I1 {
  e1,
//^^
// [analyzer] unspecified
// [cfe] unspecified
  e2,
  e3;
}

enum E2 implements I2 {
  e1,
//^^
// [analyzer] unspecified
// [cfe] unspecified
  e2,
  e3;
}

enum E3 implements I3 {
  e1,
//^^
// [analyzer] unspecified
// [cfe] unspecified
  e2,
  e3;
}

enum E4 implements I4 {
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1,
//^^
// [analyzer] unspecified
// [cfe] unspecified
  e2,
  e3;
}

enum E5 implements I5 {
  e1,
//^^
// [analyzer] unspecified
// [cfe] unspecified
  e2,
  e3;
}

enum E6 implements I6 {
  e1,
//^^
// [analyzer] unspecified
// [cfe] unspecified
  e2,
  e3;
}

main() {
  E1.e1;
  E2.e1;
  E3.e1;
  E4.e1;
  E5.e1;
  E6.e1;
}
