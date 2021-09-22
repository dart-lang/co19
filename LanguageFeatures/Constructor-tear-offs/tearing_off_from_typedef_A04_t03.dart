// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type alias is not instantiated, then it's a function from
/// types to types, not an alias for a single type, and tearing off a
/// constructor works equivalently to tearing off a corresponding generic
/// function where the generics match the type alias, not the underlying class.
/// The result is a compile-time constant.
///
/// @description Checks that the result of the not instantiated type alias
/// tearing off is a compile-time constant.
///
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class A<T extends num> {
  T? i, j;
  A();
  A.constr(this.i, this.j);
}

typedef IntList = List;

typedef AAlias = A<int>;

testList() {
  var v1 = IntList.filled;
  const v2 = IntList.filled;
  const v3 = IntList.filled;

  Expect.identical(v1, v2);
  const CheckIdentical(v2, v3);

  var v4 = (IntList.filled);
  Expect.identical(v1, v4);
}

testA_new() {
  var v1 = A.new;
  var v2 = A.new;
  var v3 = A.new;

  Expect.identical(v1, v2);
  Expect.identical(v1, v3);

  var v4 = (A.new);
  Expect.identical(v1, v4);
}

testA_constr() {
  var v1 = A.constr;
  var v2 = A.constr;
  var v3 = A.constr;

  Expect.identical(v1, v2);
  Expect.identical(v1, v3);

  var v4 = (A.constr);
  Expect.identical(v1, v4);
}

void main() {
  testList();
  testA_new();
  testA_constr();
}
