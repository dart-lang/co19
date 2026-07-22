// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `D` augments a declaration `I` with the same name and in the same
/// augmentation context as `D`. There may be multiple augmentations in the
/// augmentation context of `D`. More precisely, `I` is the declaration before
/// `D` and after every other declaration before `D`.
///
/// It's a compile-time error if there is no matching declaration `I`. In other
/// words, it's an error to have a declaration marked `augment` with no
/// declaration to apply it to.
///
/// @description Checks that it is a compile-time error if an instance member
/// augments a static one.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  static void method() {}
  static int get getter => 0;
  static void set setter(int _) {}
  static int variable = 0;
}

augment class C {
  augment void method();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get getter;
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set setter(int _);
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract int variable;
//                     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void method() {}
  static int get getter => 0;
  static void set setter(int _) {}
  static int variable = 0;
}

augment mixin M {
  augment void method();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get getter;
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set setter(int _);
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract int variable;
//                     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  static void method() {}
  static int get getter => 0;
  static void set setter(int _) {}
  static final int variable = 0;
}

augment enum E {
  ;
  augment void method();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get getter;
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set setter(int _);
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final int variable;
//                           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void method() {}
  static int get getter => 0;
  static void set setter(int _) {}
}

augment extension Ext {
  augment void method();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get getter;
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set setter(int _);
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void method() {}
  static int get getter => 0;
  static void set setter(int _) {}
}

augment class C {
  augment void method();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get getter;
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set setter(int _);
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
