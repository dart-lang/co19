// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// - A function is not complete after all augmentations are applied, unless
///   it's an instance member and the surrounding class is abstract.
///
/// @description Checks that it is a compile-time error if a function is not
/// complete after all augmentations are applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void topLevelFunction1();
//   ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
void topLevelFunction2([int v]);
//   ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
void topLevelFunction3({int v});
//   ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment void topLevelFunction1();
augment void topLevelFunction2([int v = 0]);
augment void topLevelFunction3({int v = 0});

class C {
  static void staticMethod1();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2([int v]);
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod3({int v});
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1();
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2([int v]);
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod3({int v});
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment String staticMethod1();
  augment String staticMethod2([int v = 0]);
  augment String staticMethod3({int v = 0});

  augment String instanceMethod1();
  augment String instanceMethod2([int v = 0]);
  augment String instanceMethod3({int v = 0});
}

mixin M {
  static void staticMethod1();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2([int v]);
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod3({int v});
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1();
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2([int v]);
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod3({int v});
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment String staticMethod1();
  augment String staticMethod2([int v = 0]);
  augment String staticMethod3({int v = 0});

  augment String instanceMethod1();
  augment String instanceMethod2([int v = 0]);
  augment String instanceMethod3({int v = 0});
}

enum E {
  e1;
  static void staticMethod1();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2([int v]);
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod3({int v});
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1();
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2([int v]);
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod3({int v});
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  augment String staticMethod1();
  augment String staticMethod2([int v = 0]);
  augment String staticMethod3({int v = 0});

  augment String instanceMethod1();
  augment String instanceMethod2([int v = 0]);
  augment String instanceMethod3({int v = 0});
}

class A {}

extension Ext on A {
  static void staticMethod1();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2([int v]);
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod3({int v});
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1();
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2([int v]);
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod3({int v});
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment String staticMethod1();
  augment String staticMethod2([int v = 0]);
  augment String staticMethod3({int v = 0});

  augment String instanceMethod1();
  augment String instanceMethod2([int v = 0]);
  augment String instanceMethod3({int v = 0});
}

extension type ET(int _) {
  static void staticMethod1();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2([int v]);
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod3({int v});
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1();
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2([int v]);
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod3({int v});
//     ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment String staticMethod1();
  augment String staticMethod2([int v = 0]);
  augment String staticMethod3({int v = 0});

  augment String instanceMethod1();
  augment String instanceMethod2([int v = 0]);
  augment String instanceMethod3({int v = 0});
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(topLevelFunction3);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
