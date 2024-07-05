// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is still a compile-time error to declare a
/// function with an optional non-nullable wildcard parameter with no default
/// value.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

void topLevelFunction([int _]) {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void staticMethod([int _]) {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod([int _]) {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void staticMethod([int _]) {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod([int _]) {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static void staticMethod([int _]) {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod([int _]) {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int i) {
  static void staticMethod([int _]) {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod([int _]) {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void staticMethod([int _]) {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod([int _]) {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  var f1 = ([int _]) {};
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(ET);
  print(A);
}
