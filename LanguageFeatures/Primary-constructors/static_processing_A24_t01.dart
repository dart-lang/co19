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
/// @description Check that if a primary constructor has an initializer list
/// then `k2` has an initializer list with the same elements.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class A(int z);

String log = "";

class C1() extends A {
  int x;
  this: x = 1, super(-1);
}

class C2(int x) extends A {
  int x;
  this: x = x, super(-x);
}

extension type ET(int v) {
  this: assert(() {
    log = "$v";
  }());
}

enum E1() {
  e0();
  final int x;
  this : x = 1;
}

enum E2(int x) {
  e0(2);
  final int x;
  this : x = x;
}

main() {
  Expect.equals(1, C1().x);
  Expect.equals(-1, C1().z);
  Expect.equals(2, C2(2).x);
  Expect.equals(-2, C2(2).z);

  ET(1);
  if (assertStatementsEnabled) {
    Expect.equals("1", log);
  }
  Expect.equals(1, E1.e0.x);
  Expect.equals(2, E2.e0.x);
}
