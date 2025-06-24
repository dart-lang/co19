// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When inferring the super-constructor invocation, s, targeting the
/// super constructor D, we include the implicit super-parameters from the
/// constructor parameter list:
///
/// The super-constructor invocation s infers a super-constructor invocation s’
/// such that
/// ...
/// If s has positional arguments, a1..ak, and ai infers mi with a context type
/// Ti, which is the type of the ith positional parameter of the targeted
/// super-constructor, then s’ has positional arguments m1..mk.
///
/// @description Check that if s has positional arguments, a1..ak, and ai infers
/// mi with a context type Ti, which is the type of the ith positional parameter
/// of the targeted super-constructor, then s’ has positional arguments m1..mk.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

test<T>(T t) {}

class S<T> {
  final f1;
  var v1;
  num i1;
  T t1;
  S(this.f1, this.v1, this.t1, [this.i1 = 0]);
}

class C<T> extends S<T> {
  C(super.f1, super.v1, super.t1, super.i1);
}

main() {
  C c = C(1, 2, 3, 4);
  test<int>(c.f1);
  test<int>(c.v1);
  test<int>(c.t1);

  Expect.isTrue(c.f1 is int);
  Expect.isFalse(c.f1 is String);
  Expect.isTrue(c.v1 is int);
  Expect.isFalse(c.v1 is String);
  Expect.equals("$int", c.i1.runtimeType.toString());
  Expect.isTrue(c.t1 is int);
  Expect.isFalse(c.t1 is String);
}
