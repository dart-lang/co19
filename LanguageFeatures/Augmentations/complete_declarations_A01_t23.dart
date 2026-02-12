// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../../Language/Expressions/Identifier_Reference/built_in_identifier_A26_t01.dart';

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
/// primary constructor adds an initializer list in in-body part.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1(var int x) {
  this;
}

augment class C1 {
  int y;
  augment this : y = 0;
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2.foo(int v) {
  this;
}

augment class C2 {
  augment this : assert(v > 0);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1(final int x) {
  e0(0);
  this;
}

augment enum E1 {
  ;
  final int y;
  augment this : y = 0;
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2.foo(int v) {
  e0(0);
  this;
}

augment enum E2 {
  ;
  augment this : assert(v > 0);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int v) {
  this;
}

augment extension type ET {
  augment this : assert(v > 0);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
  print(ET);
}
