// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The constant-ness, identity and equality of the torn-off
/// constructor functions behave exactly the same as if they were tear-offs of
/// the corresponding static function. This means that a non-generic class
/// constructor always tears off to the same function value, as does an
/// uninstantiated tear off of a generic class constructor.
///
/// @description Checks that a non-generic class constructor always tears off to
/// the same function value: test constructors with initializing formals.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class C {
  int? i, j;
  C(this.i, this.j) {}
  C.constr1(this.i, this.j);
  C.constr2(i, this.j) {}
}

main() {
  const v1 = C.new;
  const v2 = C.new;
  Expect.equals(v1, v2);
  const CheckIdentical(v1, v2);

  var v4 = C.constr1;
  var v5 = C.constr1;
  Expect.equals(v4, v5);
  Expect.identical(v4, v5);

  const v7 = C.constr2;
  const v8 = C.constr2;
  Expect.equals(v7, v8);
  const CheckIdentical(v7, v8);

  Expect.notEquals(v1, v4);
  Expect.notEquals(v2, v7);
  Expect.notEquals(v5, v8);
}
