// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the declaring constructor is found in the
/// following steps, where `D` is the class, extension type, or enum declaration
/// in the program that includes a declaring constructor `k`, and `D2` is the
/// result of the derivation of the semantics of `D`. The derivation step will
/// delete elements that amount to the declaring constructor. Semantically, it
/// will add a new constructor `k2`, and it will add zero or more instance
/// variable declarations.
/// ...
/// If there is an initializer list following the formal parameter list `L` then
/// `k2` has an initializer list with the same elements in the same order.
///
/// @description Check that it is a compile-time error if a parameter of a
/// declaring constructor is initialized both by an initializing formal or by a
/// declaring formal parameter of a declaing constructor and in the initializer
/// list. Test classes.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class A {
  int z;
  A(this.z);
}

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

class C4(super.z) extends A {
  this: super(0);
//      ^^^^^
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

class C11 {
  this(var int x) : x = 1;
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C12 {
  this(final int x) : x = 2;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C13 {
  int x;
  this(this.x) : x = x;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C14 extends A {
  this(super.z) : super(0);
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C15 {
  this([var int x = 0]) : x = 15;
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C16 {
  this([final int x = 0]) : x = 16;
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C17 {
  this({var int x = 0}) : x = 17;
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C18 {
  this({final int x = 0}) : x = 18;
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C19 {
  this({required var int x}) : x = 19;
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C20 {
  this({required final int x}) : x = 20;
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
  print(C7);
  print(C8);
  print(C9);
  print(C10);
  print(C11);
  print(C12);
  print(C13);
  print(C14);
  print(C15);
  print(C16);
  print(C17);
  print(C18);
  print(C19);
  print(C20);
}
