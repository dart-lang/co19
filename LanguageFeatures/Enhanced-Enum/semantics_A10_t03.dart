// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the resulting class would have any naming conflicts, or other
/// compile-time errors, the enum declaration is invalid and a compile-time
/// error occurs. Such errors include, but are not limited to:
/// ...
/// Declaring or mixing in a member which is not a valid override of a
/// super-interface member declaration, including, but not limited to, the index
/// and toString members of Enum.
///
/// @description Check that it is a compile-time error to mixin a member which
/// is not a valid override of a super-interface member declaration
/// @author sgrekhov@unipro.ru
/// @issue 48298

// SharedOptions=--enable-experiment=enhanced-enums

mixin M1 on Enum {
  String get index => "Lily was here";
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int toString() => 42;
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
enum E1 with M1 {
  e1,
  e2,
  e3;
}

mixin M2 on Enum {
  int index() => 42;
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set toString(int index) {}
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2<T> with M2 {
  e1<int>(42),
  e2<String>("42"),
  e3<bool>(false);

  const E2(T t);
}

main() {
  E1.e1;
  E2.e1;
}
