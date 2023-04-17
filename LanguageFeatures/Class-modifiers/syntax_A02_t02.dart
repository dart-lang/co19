// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The modifiers do not apply to other declarations like enum,
/// typedef, or extension
///
/// @description Check that it is a compile-time error to specify any modifier
/// before `typedef`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

class C {}

  abstract typedef T1 = C;
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final typedef T2 = C;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  sealed typedef T3 = C;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  interface typedef T4 = C;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  mixin typedef T5 = C;
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  base typedef T6 = C;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(T1);
  print(T2);
  print(T3);
  print(T4);
  print(T5);
  print(T6);
}
