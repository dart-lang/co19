// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error to add a body to an
/// already complete static method.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  static void staticMethod() {}
}

augment class C {
  augment static void staticMethod() {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void staticMethod() {}
}

augment mixin M {
  augment static void staticMethod() {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static void staticMethod() {}
}

augment enum E {
  ;
  augment static void staticMethod() {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void staticMethod() {}
}

augment extension Ext {
  augment static void staticMethod() {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void staticMethod() {}
}

augment extension type ET {
  augment static void staticMethod() {}
//                                   ^
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
