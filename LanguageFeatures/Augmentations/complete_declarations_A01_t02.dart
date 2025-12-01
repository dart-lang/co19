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
/// @description Checks that it is a compile-time error if the introductory
/// constructor has a redirecting initializer and the augmenting has initializer
/// list elements.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x;
  C(this.x);
  C.foo() : this(0);
}

augment class C {
  augment C.foo() : x = 1;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0.foo();
  final int x;
  const E(this.x);
  const E.foo() : this(0);
}

augment enum E {
  ;
  augment const E.foo() : x = 1;
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int v) {
  ET.foo() : this(0);
}

augment extension type ET {
  augment ET.foo() : x = 1;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
