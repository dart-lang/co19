// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We infer the type of a parameter declaration, p, of a
/// non-redirecting generative constructor, C, as:
/// ...
/// Otherwise, if the parameter is a super parameter (super.name) the inferred
/// type of the parameter is the associated super-constructor parameter (which
/// must exist, otherwise we’d have a compile-time error).
///
/// @description Check that if the parameter is a super parameter (super.name)
/// the inferred type of the parameter is the associated super-constructor
/// parameter
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

import "../../Utils/expect.dart";

test<T>(T t) {}

class S<T> {
  final f1;
  var v1;
  int i1;
  T t1;
  S(this.f1, this.v1, this.i1, this.t1, var x) {
    test<int>(x);
  }
}

class C<T> extends S<T> {
  final f2;
  var v2;
  int i2;
  T t2;
  C(super.f1, super.v1, super.i1, super.t1, super.x, this.f2, this.v2, this.i2,
    this.t2);
}

main() {
  C<int> c = C<int>(1, 2, 3, 4, 5, 6, 7, 8, 9);
  test<int>(c.f1);
  test<int>(c.v1);
  test<int>(c.i1);
  test<int>(c.t1);
  test<int>(c.f2);
  test<int>(c.v2);
  test<int>(c.i2);
  test<int>(c.t2);

  Expect.isTrue(c.f1 is int);
  Expect.isFalse(c.f1 is String);
  Expect.isTrue(c.v1 is int);
  Expect.isFalse(c.v1 is String);
  Expect.isTrue(c.i1 is int);
  Expect.isFalse(c.i1 is String);
  Expect.isTrue(c.t1 is int);
  Expect.isFalse(c.t1 is String);
  Expect.isTrue(c.f2 is int);
  Expect.isFalse(c.f2 is String);
  Expect.isTrue(c.v2 is int);
  Expect.isFalse(c.v2 is String);
  Expect.isTrue(c.i2 is int);
  Expect.isFalse(c.i2 is String);
  Expect.isTrue(c.t2 is int);
  Expect.isFalse(c.t2 is String);
}
