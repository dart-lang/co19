// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The following applies to both the header and the body form of
/// declaring constructors.
///
/// The semantics of the declaring constructor is found in the following steps,
/// where `D` is the class, extension type, or enum declaration in the program
/// that includes a declaring constructor, and `D2` is the result of the
/// derivation of the semantics of `D`. The derivation step will delete elements
/// that amount to the declaring constructor; it will add a new constructor `k`;
/// and it will add zero or more instance variable declarations.
///
/// Where no processing is mentioned below, `D2` is identical to `D`. Changes
/// occur as follows:
/// ...
/// The current scope of the formal parameter list of the declaring constructor
/// in `D` is the body scope of the class.
///
/// @description Check that the current scope of the formal parameter list of
/// the declaring constructor is the body scope of the class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

class C1([@m final int v = m]) {
  static const int m = 1;
}

class C2({@m var int v = m}) {
  static const int m = 2;
}

class C3 {
  this([@m var int v = m]);
  static const int m = 3;
}

class C4 {
  this({@m final int v = m});
  static const int m = 4;
}

extension type ET1([@m final int v = m]) {
  static const int m = 1;
}

extension type ET2({@m int v = m}) {
  static const int m = 2;
}

extension type ET3 {
  this([@m final int v = m]);
  static const int m = 3;
}

extension type ET4 {
  this({@m final int v = m});
  static const int m = 4;
}

enum E1([@m final int v = m]) {
  e0(0), e1;
  static const int m = 1;
}

enum E2({@m final int v = m}) {
  e0(v: 0), e1;
  static const int m = 2;
}

enum E3 {
  e0(0), e1;
  this([@m final int v = m]);
  static const int m = 3;
}

enum E4 {
  e0(v: 0), e1;
  this({@m final int v = m});
  static const int m = 4;
}

main() {
  Expect.equals(1, C1().v);
  Expect.equals(-1, C1(-1).v);
  Expect.equals(2, C2().v);
  Expect.equals(-2, C2(v: -2).v);
  Expect.equals(3, C3().v);
  Expect.equals(-3, C3(-3).v);
  Expect.equals(4, C4().v);
  Expect.equals(-4, C4(v: -4).v);

  Expect.equals(1, ET1().v);
  Expect.equals(-1, ET1(-1).v);
  Expect.equals(2, ET2().v);
  Expect.equals(-2, ET2(v: -2).v);
  Expect.equals(3, ET3().v);
  Expect.equals(-3, ET3(-3).v);
  Expect.equals(4, ET4().v);
  Expect.equals(-4, ET4(v: -4).v);

  Expect.equals(1, E1.e1.v);
  Expect.equals(0, E1.e0.v);
  Expect.equals(2, E2.e1.v);
  Expect.equals(0, E2.e0.v);
  Expect.equals(3, E3.e1.v);
  Expect.equals(0, E3.e0.v);
  Expect.equals(4, E4.e1.v);
  Expect.equals(0, E4.e0.v);
}
