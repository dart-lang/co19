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
/// A super parameter is copied from `L` to `L2` along with the default value,
/// if any, and is otherwise unchanged.
///
/// @description Check that a super parameter (which has a corresponding
/// initializing formal parameter in the superconstructor) of a declaring
/// constructor initializes the appropriate instance variable and preserves the
/// default value. Test required parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class A<T> {
  String v1;
  T v2;
  A(this.v1, this.v2);
}

class C1<T>(super.v1, T super.v2) extends A<T>;

class C2(String super.v1, super.v2) extends A<int> {}

class C3<T> extends A<T> {
  this(super.v1, T super.v2);
}

class C4 extends A<int> {
  this(String super.v1, super.v2);
}

main() {
  var c1 = C1<int>("v1", 2);
  Expect.equals("v1", c1.v1);
  Expect.equals(2, c1.v2);

  var c2 = C2("v1", 2);
  Expect.equals("v1", c2.v1);
  Expect.equals(2, c2.v2);

  var c3 = C3<int>("v1", 2);
  Expect.equals("v1", c3.v1);
  Expect.equals(2, c3.v2);

  var c4 = C4("v1", 2);
  Expect.equals("v1", c4.v1);
  Expect.equals(2, c4.v2);
}
