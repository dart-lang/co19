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

import "../../Utils/expect.dart";

test<T>(T? t) {}

class S<T> {
  final f1;
  var v1;
  int? i1;
  T? t1;
  S([this.f1, this.v1, this.i1, this.t1]);
}

class C<T> extends S<T> {
  final f2;
  var v2;
  int? i2;
  T? t2;
  C([super.f1, super.v1, super.i1, super.t1, this.f2, this.v2, this.i2, this.t2]);
}

main() {
  var c1 = C(1, 2, 3, 4, 5, 6, 7, 8);
  test<int>(c1.f1);
  test<int>(c1.v1);
  test<int?>(c1.i1);
  test<int>(c1.t1);
  test<int>(c1.f2);
  test<int>(c1.v2);
  test<int?>(c1.i2);
  test<int>(c1.t2);

  Expect.isTrue(c1.f1 is int);
  Expect.isFalse(c1.f1 is String);
  Expect.isTrue(c1.v1 is int);
  Expect.isFalse(c1.v1 is String);
  Expect.isTrue(c1.i1 is int?);
  Expect.isFalse(c1.i1 is String);
  Expect.isTrue(c1.t1 is int);
  Expect.isFalse(c1.t1 is String);
  Expect.isTrue(c1.f2 is int);
  Expect.isFalse(c1.f2 is String);
  Expect.isTrue(c1.v2 is int);
  Expect.isFalse(c1.v2 is String);
  Expect.isTrue(c1.i2 is int?);
  Expect.isFalse(c1.i2 is String);
  Expect.isTrue(c1.t2 is int);
  Expect.isFalse(c1.t2 is String);
  Expect.runtimeIsType<int>(c1.f1);
  Expect.runtimeIsNotType<String>(c1.f1);
  Expect.runtimeIsType<int>(c1.v1);
  Expect.runtimeIsNotType<String>(c1.v1);
  Expect.runtimeIsType<int>(c1.i1);
  Expect.runtimeIsNotType<String>(c1.i1);
  Expect.runtimeIsType<int>(c1.t1);
  Expect.runtimeIsNotType<String>(c1.t1);
  Expect.runtimeIsType<int>(c1.f2);
  Expect.runtimeIsNotType<String>(c1.f2);
  Expect.runtimeIsType<int>(c1.v2);
  Expect.runtimeIsNotType<String>(c1.v2);
  Expect.runtimeIsType<int>(c1.i2);
  Expect.runtimeIsNotType<String>(c1.i2);
  Expect.runtimeIsType<int>(c1.t2);
  Expect.runtimeIsNotType<String>(c1.t2);

  C<int> c2 = C(1, 2, 3, 4, 5, 6, 7, 8);
  test<int>(c2.f1);
  test<int>(c2.v1);
  test<int?>(c2.i1);
  test<int?>(c2.t1);
  test<int>(c2.f2);
  test<int>(c2.v2);
  test<int?>(c2.i2);
  test<int?>(c2.t2);

  Expect.isTrue(c2.f1 is int);
  Expect.isFalse(c2.f1 is String);
  Expect.isTrue(c2.v1 is int);
  Expect.isFalse(c2.v1 is String);
  Expect.isTrue(c2.i1 is int?);
  Expect.isFalse(c2.i1 is String);
  Expect.isTrue(c2.t1 is int);
  Expect.isFalse(c2.t1 is String);
  Expect.isTrue(c2.f2 is int);
  Expect.isFalse(c2.f2 is String);
  Expect.isTrue(c2.v2 is int);
  Expect.isFalse(c2.v2 is String);
  Expect.isTrue(c2.i2 is int?);
  Expect.isFalse(c2.i2 is String);
  Expect.isTrue(c2.t2 is int);
  Expect.isFalse(c2.t2 is String);
  Expect.runtimeIsType<int>(c2.f1);
  Expect.runtimeIsNotType<String>(c2.f1);
  Expect.runtimeIsType<int>(c2.v1);
  Expect.runtimeIsNotType<String>(c2.v1);
  Expect.runtimeIsType<int>(c2.i1);
  Expect.runtimeIsNotType<String>(c2.i1);
  Expect.runtimeIsType<int>(c2.t1);
  Expect.runtimeIsNotType<String>(c2.t1);
  Expect.runtimeIsType<int>(c2.f2);
  Expect.runtimeIsNotType<String>(c2.f2);
  Expect.runtimeIsType<int>(c2.v2);
  Expect.runtimeIsNotType<String>(c2.v2);
  Expect.runtimeIsType<int>(c2.i2);
  Expect.runtimeIsNotType<String>(c2.i2);
  Expect.runtimeIsType<int>(c2.t2);
  Expect.runtimeIsNotType<String>(c2.t2);
}
