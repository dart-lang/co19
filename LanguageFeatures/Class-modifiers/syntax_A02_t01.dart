// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The modifiers do not apply to other declarations like enum,
/// typedef, or extension
///
/// @description Check that it is a compile-time error to specify any modifier
/// before `enum`
/// @author sgrekhov22@gmail.com

  abstract enum E1 {e1, e2}
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final enum E2 {e1, e2}
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  sealed enum E3 {e1, e2}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  interface enum E4 {e1, e2}
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  mixin enum E5 {e1, e2}
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  base enum E6 {e1, e2}
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
  print(E6);
}
