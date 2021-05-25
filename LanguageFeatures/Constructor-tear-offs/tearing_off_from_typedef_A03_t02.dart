// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With generalized type-aliases, it's possible to declare a
/// class-alias like [typedef IntList = List<int>;]. ... It's constant and
/// canonicalized to the same function as [List<int>.filled]. In other words,
/// the alias is treated as an actual alias for the type it aliases.
///
/// @description Checks that class-alias [typedef IntList = List] is
/// constant and canonicalized. Tests raw [List] class.
/// @author iarkh@unipro.ru

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
  var v2 = IntList.filled;
  var v3 = IntList.filled;

  Expect.identical(v1, v2);
  Expect.identical(v1, v3);

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
