// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the resulting class would have any naming conflicts, or other
/// compile-time errors, the enum declaration is invalid and a compile-time
/// error occurs.
///
/// @description Check that if the resulting class would have any naming
/// conflicts then compile-time error occurs.
/// @author sgrekhov@unipro.ru
/// @issue 48289

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
//   ^^
// [analyzer] unspecified
  e1,
  e2,
  e3;

  final int values = 42;
//          ^^^^^^
// [cfe] unspecified
}

enum E2<T> {
//   ^^^^^
// [analyzer] unspecified
  e1<int>(42),
  e2<String>("42"),
  e3<bool>(false);

  const E2(T t);

  final List<E2> values = const [];
//               ^^^^^^
// [cfe] unspecified
}

main() {
  E1.e1;
  E2.e1;
}
