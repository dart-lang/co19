// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error if both the introductory
/// and the augmenting constructors have initializing formals.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x;
  C(this.x);
  C.foo([this.x]);
  C.bar({this.x});
  C.baz({required this.x});
}

augment class C {
  augment C(this.x);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo([this.x = 0]);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.bar({this.x = 0});
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.baz({required this.x});
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(0);

  final int x;
  const C(this.x);
  const C.foo([this.x]);
  const C.bar({this.x});
  const C.baz({required this.x});
}

augment enum E {
  ;
  augment const E(this.x);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo([this.x = 0]);
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.bar({this.x = 0});
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.baz({required this.x});
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET._(int x) {
  ET(this.x);
  ET.foo([this.x]);
  ET.bar({this.x});
  ET.baz({required this.x});
}

augment extension type ET {
  augment ET(this.x);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.foo([this.x = 0]);
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar({this.x = 0});
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.baz({required this.x});
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
