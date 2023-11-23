// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the resulting class would have any naming conflicts, or other
/// compile-time errors, the enum declaration is invalid and a compile-time
/// error occurs. Such errors include, but are not limited to:
/// ...
/// Using a non-constant expression as argument of an enum value.
///
/// @description Check that it is a compile-time error if non-constant value is
/// used as argument of an enum value
/// @author sgrekhov@unipro.ru
/// @issue 48292
/// @issue 48293

int i = 42;
String s = "Lily was here";

enum E1 {
  e1<int>(i),
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  e2<String>(s);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  const E1(var v);
}

enum E2<T> {
//   ^^
// [cfe] unspecified
  e1<int>(i),
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  e2<String>("Type is $T");
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
  const E2(T t);
}

main() {
  E1.e1;
  E2.e1;
}
