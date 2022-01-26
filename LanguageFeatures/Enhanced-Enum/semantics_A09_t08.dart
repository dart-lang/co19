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

// SharedOptions=--enable-experiment=enhanced-enums

mixin M1 on Enum {
  int e1() => 42;
}

mixin M2 on Enum {
  final int e1 = 42;
}

mixin M3 on Enum {
  int get e1 => 42;
}

mixin M4 on Enum {
  void set e1(int v) {}
}

enum E1 with M1 {
  e1,
//^^
// [analyzer] unspecified
// [cfe] unspecified
  e2,
  e3;
}

enum E2 with M2 {
  e1,
//^^
// [analyzer] unspecified
// [cfe] unspecified
  e2,
  e3;
}

enum E3 with M3 {
  e1,
//^^
// [analyzer] unspecified
// [cfe] unspecified
  e2,
  e3;
}

enum E4 with M4 {
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
}
