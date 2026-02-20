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
/// @description Checks that it is a compile-time error if an augmentation adds
/// a body to a primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1() {}

augment class C1 {
  augment C1() {}
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(var int v) {
  this;
}

augment class C2 {
  augment this {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3.foo(int v);

augment class C3 {
  augment C3.foo(int v) {}
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

// Constructor of an enum must be a constant and therefore cannot have a body.
// That's why we don't have tests for enums here (enum's constructor with a body
// is an error, augmenting or not).

extension type ET1(int id) {}

augment extension type ET1 {
  augment ET1(int id) {}
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2.foo(int id) {
  this;
}

augment extension type ET2 {
  augment this {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3.new(int id) {}

augment extension type ET3 {
  augment ET3.new(int id) {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(ET1);
  print(ET2);
  print(ET3);
}
