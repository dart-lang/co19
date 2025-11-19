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
/// @description Check that if a declaring constructor has an initializer list
/// then `k2` has an initializer list with the same elements.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class A(int z);

class C2() extends A {
  int x;
  this: x = 2, super(-2);
}

class C3(int x) extends A {
  int x;
  this: x = x, super(-x);
}

class C4 extends A {
  int x;
  this() : x = 4, super(-4);
}

class C5 extends A {
  int x;
  this(int x) : x = 5, super(-5);
}

enum E2() {
  e0();
  final int x;
  this : x = 2;
}

enum E3(int x) {
  e0(3);
  final int x;
  this : x = x;
}

enum E4 {
  e0();
  final int x;
  const this() : x = 4;
}

enum E5 {
  e0(5);
  final int x;
  const this(int x) : x = x;
}

main() {
  Expect.equals(2, C2().x);
  Expect.equals(-2, C2().z);
  Expect.equals(3, C3(3).x);
  Expect.equals(-3, C3(3).z);
  Expect.equals(4, C4().x);
  Expect.equals(-4, C4().z);
  Expect.equals(5, C5(5).x);
  Expect.equals(-5, C5(5).z);

  Expect.equals(2, E2.e0.x);
  Expect.equals(3, E3.e0.x);
  Expect.equals(4, E4.e0.x);
  Expect.equals(5, E5.e0.x);
}
