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
/// @issue 48290
/// @issue 48293

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
//   ^^
// [cfe] unspecified
  e1,
//^^
// [analyzer] unspecified
  e2,
  e3;

  final int e1 = 42;
//          ^^
// [cfe] unspecified
}

enum E2<T> {
//   ^^
// [cfe] unspecified
  e1<int>(42),
  e2<String>("42"),
//^^
// [analyzer] unspecified
  e3<bool>(false);

  const E2(T t);
  final List<E2> e2 = const [];
//               ^^
// [cfe] unspecified
}

enum E3 {
//   ^^
// [analyzer] unspecified
  e1,
  e2,
  e3;

  static final int e1 = 42;
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
}
