// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The modifiers do not apply to other declarations like enum,
/// typedef, or extension
///
/// @description Check that it is a compile-time error to specify any modifier
/// before `extension`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

class C {}

  abstract extension E1 on C {foo1() {}}
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final extension E2 on C {foo2() {}}
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  sealed extension E3 on C {foo3() {}}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  interface extension E4 on C {foo4() {}}
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  mixin extension E5 on C {foo5() {}}
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  base extension E6 on C {foo6() {}}
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
}
