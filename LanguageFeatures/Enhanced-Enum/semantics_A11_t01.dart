// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the resulting class would have any naming conflicts, or other
/// compile-time errors, the enum declaration is invalid and a compile-time
/// error occurs. Such errors include, but are not limited to:
/// ...
/// Declaring or inheriting a member signature with no corresponding
/// implementation. (For example declaring an abstract `Never get index` or
/// `String toString([int optional])`, but not providing an implementation.)
///
/// @description Check that it is a compile-time error to declare a member
/// signature with no corresponding implementation
/// @author sgrekhov@unipro.ru
/// @issue 48291

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1,
  e2,
  e3;

  String toString([int index]);
  void foo();
//     ^^^
// [analyzer] unspecified
}

enum E2<T> {
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1<int>(42),
  e2<String>("42"),
  e3<bool>(false);

  const E2(T t);

  String toString([int index]);
  void foo();
//     ^^^
// [analyzer] unspecified
}

main() {
  E1.e1;
  E2.e1;
}
