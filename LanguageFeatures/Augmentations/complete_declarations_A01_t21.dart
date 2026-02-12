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
/// @description Checks that it is a compile-time error if an augmentation of a
/// primary constructor has an initializing formals.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1(var int v) {}

augment class C1 {
  augment C1(this.v);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2.foo(final int v);

augment class C2 {
  augment C2.foo(this.v);
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E(final int v) {
  e0(0);
}

augment enum E {
  ;
  augment E(this.v);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {}

augment extension type ET {
  augment ET(this.id);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(E);
  print(ET);
}
