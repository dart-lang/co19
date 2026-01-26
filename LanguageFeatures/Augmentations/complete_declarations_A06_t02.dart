// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion More precisely, a function or constructor declaration
/// (introductory or augmenting) is incomplete if all of:
/// - It has no body. That means no `{ ... }` or `=> ...;` but only `;`.
/// - The function is not marked external. An external function is considered to
///   have a body, just not one that is visible as Dart code.
/// - There is no redirection, initializer list, initializing formals, field
///   parameters, or super parameters. Obviously, this only applies to
///   constructor declarations.
///
/// If a declaration is not incomplete then it is complete.
///
/// It's a compile-time error if an augmentation is complete and any declaration
/// before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error if a late variable is
/// augmented with another non-abstract late variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

late int topLevelVariable;
augment late int topLevelVariable = 0;
//               ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static late int staticVariable;
  late int instanceVariable;
}

augment class C {
  augment static late int staticVariable = 0;
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment late int instanceVariable = 0;
//                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static late int staticVariable;
  late int instanceVariable;
}

augment mixin M {
  augment static late int staticVariable = 0;
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment late int instanceVariable = 0;
//                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static late int staticVariable;
}

augment enum E {
  ;
  augment static late int staticVariable = 0;
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static late int staticVariable;
}

augment extension Ext {
  augment static late int staticVariable = 0;
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static late int staticVariable;
}

augment extension type ET {
  augment static late int staticVariable = 0;
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
