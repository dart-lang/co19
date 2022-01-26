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
/// @description Check that it is a compile-time error to declare any member
/// with the same basename as enum value which is not a static setter
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
  e1,
  e2,
  e3;

  final int e1 = 42;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2<T> {
  e1<int>(42),
  e2<String>("42"),
  e3<bool>(false);

  const E2(T t);
  final List<E2> e2 = [];
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3 {
  e1,
  e2,
  e3;

  static final int e1 = 42;
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  E1.e1;
  E2.e1;
  E3.e1;
}
