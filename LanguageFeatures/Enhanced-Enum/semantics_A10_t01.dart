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
/// @description Check that it is a compile-time error to declare a member which
/// is not a valid override of a super-interface member declaration
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
  e1,
  e2,
  e3;

  String get index => "Lily was here";
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String toString(int index) => "E1";
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2<T> {
  e1<int>(42),
  e2<String>("42"),
  e3<bool>(false);

  const E2(T t);
  String index() => "Lily was here";
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set toString(int index) {}
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  E1.e1;
  E2.e1;
}
