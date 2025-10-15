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
/// @description Check that it is a compile-time error if a declaring
/// constructor has an initializer list with superconstructor invocation not in
/// the end of the list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class A(int z);

class C2() extends A {
  int x;
  this: super(-2), x = 2;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3(int x) extends A {
  int x;
  this: super(-x), x = x;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 extends A {
  int x;
  this() : super(-4), x = 4;
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5 extends A {
  int x;
  this(int x) : super(-5), x = 5;
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C2);
  print(C3);
  print(C4);
  print(C5);
}
