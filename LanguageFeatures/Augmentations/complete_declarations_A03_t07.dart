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
/// @description Checks that it is a compile-time error to add a body to an
/// external instance method.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  external void externalInstanceMethod1();
  external void externalInstanceMethod2();
}

augment class C {
  augment void externalInstanceMethod1() {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external void externalInstanceMethod2();
//                      ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  external void externalInstanceMethod1();
  external void externalInstanceMethod2();
}

augment mixin M {
  augment void externalInstanceMethod1() {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external void externalInstanceMethod2();
//                      ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  external void externalInstanceMethod1();
  external void externalInstanceMethod2();
}

augment enum E {
  ;
  augment void externalInstanceMethod1() {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external void externalInstanceMethod2();
//                      ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  external void externalInstanceMethod1();
  external void externalInstanceMethod2();
}

augment extension Ext {
  augment void externalInstanceMethod1() {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
augment external void externalInstanceMethod2();
//                      ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  external void externalInstanceMethod1();
  external void externalInstanceMethod2();
}

augment extension type ET {
  augment void externalInstanceMethod1() {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external void externalInstanceMethod2();
//                      ^^^^^^^^^^^^^^^^^^^^^^^
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
