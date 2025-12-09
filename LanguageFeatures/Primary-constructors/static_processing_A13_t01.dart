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
/// The current scope of the formal parameter list of the primary constructor
/// in `D` is the body scope of the class.
///
/// @description Check that the current scope of the formal parameter list of
/// the primary constructor is the body scope of the class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C1([@m final int v = m]) {
  static const int m = 1;
}

class C2({@m var int v = m}) {
  static const int m = 2;
}

extension type ET1([@m final int v = m]) {
  static const int m = 1;
}

extension type ET2({@m int v = m}) {
  static const int m = 2;
}

enum E1([@m final int v = m]) {
  e0(0), e1;
  static const int m = 1;
}

enum E2({@m final int v = m}) {
  e0(v: 0), e1;
  static const int m = 2;
}

main() {
  Expect.equals(1, C1().v);
  Expect.equals(-1, C1(-1).v);
  Expect.equals(2, C2().v);
  Expect.equals(-2, C2(v: -2).v);

  Expect.equals(1, ET1().v);
  Expect.equals(-1, ET1(-1).v);
  Expect.equals(2, ET2().v);
  Expect.equals(-2, ET2(v: -2).v);

  Expect.equals(1, E1.e1.v);
  Expect.equals(0, E1.e0.v);
  Expect.equals(2, E2.e1.v);
  Expect.equals(0, E2.e0.v);
}
