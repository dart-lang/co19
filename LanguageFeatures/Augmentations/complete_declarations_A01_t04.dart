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
/// @description Checks that it is a compile-time error if a non-redirecting
/// constructor augments a constructor which is not potentially non-redirecting.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class A {}

class C extends A {
  int x;
  C(this.x);
  C.foo(): this(0);
}

augment class C {
  augment C.foo(): x = 1, super(0);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
