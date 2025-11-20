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
/// The formal parameter list `L2` of `k2` is identical to `L`, except that each
/// formal parameter is processed as follows.
/// ...
/// A super parameter is copied from `L` to `L2` along with the default value,
/// if any, and is otherwise unchanged.
///
/// @description Check that a super parameter (which has a corresponding
/// initializing formal parameter in the superconstructor) of a primary
/// constructor initializes the appropriate instance variable and preserves the
/// default value. Test optional named parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class A<T> {
  String v1;
  T? v2;
  A(this.v1, this.v2);
}

class C1<T>({super.v1 = "v1", T? super.v2}) extends A<T>;

class C2({String super.v1 = "v1", super.v2 = 2}) extends A<int> {}

main() {
  var c1 = C1<int>(v1: "C1", v2: 2);
  Expect.equals("C1", c1.v1);
  Expect.equals(2, c1.v2);
  c1 = C1<int>();
  Expect.equals("v1", c1.v1);
  Expect.isNull(c1.v2);

  var c2 = C2<int>(v1: "C2", v2: 2);
  Expect.equals("C2", c2.v1);
  Expect.equals(2, c2.v2);
  c2 = C2<int>();
  Expect.equals("v1", c2.v1);
  Expect.isNull(c2.v2);
}
