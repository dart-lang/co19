// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of the named constructor tear-off expression is
/// the same as the static type of the corresponding constructor function
/// tear-off.
///
/// @description Checks that the static types of the constructor tear off
/// expressions are the same - test non-generic class
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  int? i;
  int? j;

  C();
  C.constr1(int i) {}
  C.constr2(int i, String s, x) {}
  C.constr3({int i = 1, required j}) {}
  C.constr4(this.i, this.j);
}

main() {
  var v1 = C.new;
  var v2 = (C.new);
  Expect.equals(v1, v2);
  Expect.identical(v1, v2);

  var v3 = C.constr1;
  var v4 = (C.constr1);
  Expect.equals(v3, v4);
  Expect.identical(v3, v4);

  const v5 = C.constr2;
  const v6 = (C.constr2);
  Expect.equals(v5, v6);
  const CheckIdentical(v5, v6);

  var v7 = C.constr3;
  var v8 = (C.constr3);
  Expect.equals(v7, v8);

  var v9 = C.constr4;
  var v10 = (C.constr4);
  Expect.equals(v9, v10);
  Expect.identical(v9, v10);
}
