// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the primary constructor is found in the
/// following steps, where `D` is the class, mixin class, extension type, or
/// enum declaration in the program that includes a primary constructor `k`, and
/// `D2` is the result of the derivation of the semantics of `D`. The derivation
/// step will delete elements that amount to the primary constructor.
/// Semantically, it will add a new constructor `k2`, and it will add zero or
/// more instance variable declarations.
/// ...
/// If there is a primary constructor body part that contains an initializer
/// list then `k2` has an initializer list with the same elements in the same
/// order. If that body part has a function body then `k2` has the same function
/// body.
///
/// @description Check that it is a compile-time error if an instance variable
/// is initialized both by an initializing formal or by a declaring formal
/// parameter of a primary constructor and in the initializer list. Test classes.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1(var int x) {
  this: x = 1;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(final int x) {
  this: x = 2;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3(this.x) {
  int x;
  this: x = x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5([var int x = 0]) {
  this: x = 5;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6([final int x = 0]) {
  this: x = 6;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C7({var int x = 0}) {
  this: x = 7;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C8({final int x = 0}) {
  this: x = 8;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C9({required var int x}) {
  this: x = 9;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C10({required final int x}) {
  this: x = 10;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C5);
  print(C6);
  print(C7);
  print(C8);
  print(C9);
  print(C10);
}
