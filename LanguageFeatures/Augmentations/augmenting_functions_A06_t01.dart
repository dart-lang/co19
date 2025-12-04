// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// - More than one declaration in the augmentation chain specifies a default
///   value for the same optional parameter. This is an error even in the case
///   where all of them are identical.
///
/// @description Checks that it is a compile-time error if more than one
/// declaration in the augmentation chain specifies a default value for the same
/// optional parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void topLevelFunction1([int v = 0]) {}
void topLevelFunction2({int v = 0}) {}

augment void topLevelFunction1([int v = 0]);
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

augment void topLevelFunction2({int v = 0});
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void staticMethod1([int v = 0]) {}
  static void staticMethod2({int v = 0}) {}
  void instanceMethod1([int v = 0]) {}
  void instanceMethod2({int v = 0}) {}
}

augment class C {
  augment static void staticMethod1([int v = 0]);
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2({int v = 0});
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1([int v = 0]);
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2({int v = 0});
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void staticMethod1([int v = 0]) {}
  static void staticMethod2({int v = 0}) {}
  void instanceMethod1([int v = 0]) {}
  void instanceMethod2({int v = 0}) {}
}

augment mixin M {
  augment static void staticMethod1([int v = 0]);
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2({int v = 0});
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1([int v = 0]);
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2({int v = 0});
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
  static void staticMethod1([int v = 0]) {}
  static void staticMethod2({int v = 0}) {}
  void instanceMethod1([int v = 0]) {}
  void instanceMethod2({int v = 0}) {}
}

augment enum E {
  ;
  augment static void staticMethod1([int v = 0]);
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2({int v = 0});
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1([int v = 0]);
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2({int v = 0});
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void staticMethod1([int v = 0]) {}
  static void staticMethod2({int v = 0}) {}
  void instanceMethod1([int v = 0]) {}
  void instanceMethod2({int v = 0}) {}
}

augment extension Ext {
  augment static void staticMethod1([int v = 0]);
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2({int v = 0});
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1([int v = 0]);
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2({int v = 0});
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void staticMethod1([int v = 0]) {}
  static void staticMethod2({int v = 0}) {}
  void instanceMethod1([int v = 0]) {}
  void instanceMethod2({int v = 0}) {}
}

augment extension type ET {
  augment static void staticMethod1([int v = 0]);
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2({int v = 0});
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1([int v = 0]);
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2({int v = 0});
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
