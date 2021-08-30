// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The constant-ness, identity and equality of the torn-off
/// constructor functions behave exactly the same as if they were tear-offs of
/// the corresponding static function. This means that a non-generic class
/// constructor always tears off to the same function value, as does an
/// uninstantiated tear off of a generic class constructor.
///
/// @description Checks that a generic class constructor always tears off to
/// the same function value: test generic constructor.
/// @author iarkh@unipro.ru


import "../../Utils/expect.dart";

class C<T1 extends int, T2, T3 extends List> {
  int? i, j;
  C.name1(T1 i, [List? l, T2? check]) {}
  C.name2(this.i, this.j);
  C() {}
}

main() {
  var v1 = C.name1;
  var v2 = C.name1;
  Expect.equals(v1, v2);
  Expect.identical(v1, v2);

  var v4 = C.name2;
  var v5 = C.name2;
  Expect.equals(v4, v5);
  Expect.identical(v4, v5);

  var v7 = C.new;
  var v8 = C.new;
  Expect.equals(v7, v8);
  Expect.identical(v7, v8);

  Expect.notEquals(v1, v4);
  Expect.notEquals(v2, v7);
  Expect.notEquals(v5, v8);
}
