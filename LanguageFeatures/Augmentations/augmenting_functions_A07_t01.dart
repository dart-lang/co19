// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// - No declaration in the augmentation chain specifies a default value for an
///   optional parameter whose declared type is potentially non-nullable, and
///   the declared function is not abstract.
///
/// @description Checks that it is a compile-time error if no declaration in the
/// augmentation chain specifies a default value for an optional parameter whose
/// declared type is potentially non-nullable, and the declared function is not
/// abstract.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void topLevelFunction1([int v]) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

void topLevelFunction2({int v}) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

augment void topLevelFunction1([int v]);
augment void topLevelFunction2({int v});

class C {
  static void staticMethod1([int v]) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2({int v}) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod1([int v]) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2({int v}) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment static void staticMethod1([int v]);
  augment static void staticMethod2({int v});
  augment void instanceMethod1([int v]);
  augment void instanceMethod2({int v});
}

mixin M {
  static void staticMethod1([int v]) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2({int v}) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod1([int v]) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2({int v}) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static void staticMethod1([int v]);
  augment static void staticMethod2({int v});
  augment void instanceMethod1([int v]);
  augment void instanceMethod2({int v});
}

enum E {
  e1;
  static void staticMethod1([int v]) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2({int v}) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod1([int v]) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2({int v}) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  static void staticMethod1([int v]) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2({int v}) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod1([int v]) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2({int v}) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void staticMethod1([int v]) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2({int v}) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod1([int v]) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2({int v}) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static void staticMethod1([int v]);
  augment static void staticMethod2({int v});
  augment void instanceMethod1([int v]);
  augment void instanceMethod2({int v});
}

extension type ET(int _) {
  static void staticMethod1([int v]) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2({int v}) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod1([int v]) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2({int v}) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static void staticMethod1([int v]);
  augment static void staticMethod2({int v});
  augment void instanceMethod1([int v]);
  augment void instanceMethod2({int v});
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
