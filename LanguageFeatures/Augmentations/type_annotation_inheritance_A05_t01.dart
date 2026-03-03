// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is omitted in the
/// augmenting declaration, it is inferred to be the same as the corresponding
/// type annotation or type parameter bound in the declaration being augmented.
///
/// If the type annotation or type parameter bound is not omitted, then it's a
/// compile-time error if the type denoted by the augmenting declaration is not
/// the same type as the type in the corresponding declaration being augmented.
///
/// @description Check that it is a compile-time error if an augmenting
/// declaration specifies a different variable type than the introductory
/// declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

num topLevelVariable = 1;
augment abstract int topLevelVariable;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final num finalTopLevelVariable;
augment final Object finalTopLevelVariable = 2;
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static num staticVariable = 1;
  static abstract final num finalStaticVariable;

  num instanceVariable = 1;
  abstract final num finalInstanceVariable;
}

augment class C {
  augment static abstract Object staticVariable;
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract final int finalStaticVariable = 2;
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract Object instanceVariable;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final int finalInstanceVariable = 2;
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static abstract num staticVariable;
  static final num finalStaticVariable = 2;

  abstract num instanceVariable;
  final num finalInstanceVariable = 2;
}

augment mixin M {
  augment static Object staticVariable = 1;
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract final int finalStaticVariable;
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object instanceVariable = 1;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final int finalInstanceVariable;
//                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static num staticVariable = 1;
  static abstract final num finalStaticVariable;
  final num finalInstanceVariable1 = 1;
  abstract final num finalInstanceVariable2;
}

augment enum E {
  ;
  augment static abstract Object staticVariable;
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract final int finalStaticVariable = 2;
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final Object finalInstanceVariable1;
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final int finalInstanceVariable2 = 2;
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static abstract num staticVariable;
  static final num finalStaticVariable = 2;
}

augment extension Ext {
  augment static Object staticVariable = 1;
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract final int finalStaticVariable;
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static num staticVariable = 1;
  static abstract final num finalStaticVariable;
}

augment extension type ET {
  augment static abstract Object staticVariable;
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract final int finalStaticVariable = 2;
//                              ^^^
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
