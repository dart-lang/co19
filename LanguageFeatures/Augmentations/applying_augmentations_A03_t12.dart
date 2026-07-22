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
/// @description Checks that it is a compile-time error if a static member
/// augments an instance one.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  void method() {}
  int get getter => 0;
  void set setter(int _) {}
  int variable = 0;
}

augment class C {
  augment static void method();
//                     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get getter;
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set setter(int _);
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract int variable;
//                            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  void method() {}
  int get getter => 0;
  void set setter(int _) {}
  int variable = 0;
}

augment mixin M {
  augment static void method();
//                    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get getter;
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set setter(int _);
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract int variable;
//                            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  void method() {}
  int get getter => 0;
  void set setter(int _) {}
  final int variable = 0;
}

augment enum E {
  ;
  augment static void method();
//                    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get getter;
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set setter(int _);
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract final int variable;
//                                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  void method() {}
  int get getter => 0;
  void set setter(int _) {}
}

augment extension Ext {
  augment static void method();
//                    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get getter;
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set setter(int _);
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  void method() {}
  int get getter => 0;
  void set setter(int _) {}
}

augment extension type ET {
  augment static void method();
//                    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get getter;
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set setter(int _);
//                        ^^^^^^
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
