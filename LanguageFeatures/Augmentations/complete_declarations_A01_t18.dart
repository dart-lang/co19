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
/// `external` constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  external C.external();
}

augment class C {
  augment C.external() {}
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0.external();
  const E();
  external const E.external();
}

augment enum E {
  ;
  augment const E.external() : this();
//                             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  external ET.external();
}

augment extension type ET {
  augment ET.external() {}
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
