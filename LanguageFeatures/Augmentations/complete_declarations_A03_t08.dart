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
/// external operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class A {}

class C {
  external void operator +(String other);
  external void operator -(String other);
}

augment class C {
  augment void operator +(String other) {}
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external void operator -(String other);
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  external void operator +(String other);
  external void operator -(String other);
}

augment mixin M {
  augment void operator +(String other) {}
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external void operator -(String other);
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
  external void operator +(String other);
  external void operator -(String other);
}

augment enum E {
  ;
  augment void operator +(String other) {}
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external void operator -(String other);
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext on A {
  external void operator +(String other);
  external void operator -(String other);
}

augment extension Ext {
  augment void operator +(String other) {}
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external void operator -(String other);
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  external void operator +(String other);
  external void operator -(String other);
}

augment extension type ET {
  augment void operator +(String other) {}
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external void operator -(String other);
//                               ^
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
