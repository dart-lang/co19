// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the resulting class would have any naming conflicts, or other
/// compile-time errors, the enum declaration is invalid and a compile-time
/// error occurs. Such errors include, but are not limited to:
/// ...
/// The type parameters of the enum not having a well-bounded
/// instantiate-to-bounds result and an enum element omitting the type arguments
/// and not having arguments which valid type arguments can be inferred from
/// (because an implicit EnumName(0, "foo", unrelatedArgs) constructor
/// invocation requires a well-bound inferred type arguments for a generic
/// EnumName enum)..
///
/// @description Check that it is a compile-time error to declare a ...
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
  e1,
  e2,
  e3;

  String toString([int index]);
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void foo();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2<T> {
  e1<int>(42),
  e2<String>("42"),
  e3<bool>(false);

  const E2(T t);

  String toString();
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void foo();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  E1.e1;
  E2.e1;
}
