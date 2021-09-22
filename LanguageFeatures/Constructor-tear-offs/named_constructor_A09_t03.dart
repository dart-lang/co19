// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of the named constructor tear-off expression is
/// the same as the static type of the corresponding constructor function
/// tear-off.
///
/// @description Checks that the static types of the constructor tear off
/// expressions are the same - test generic class
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C<T> {
  T? i;
  T? j;

  C();
  C.constr1(T i) {}
  C.constr2(int i, String s, x) {}
  C.constr3({int i = 1, required T j}) {}
  C.constr4(this.i, this.j);
}

main() {
  var v1 = C<int>.new;
  var v3 = (C.new)<int>;
  Expect.equals(v1, v3);
  Expect.identical(v1, v3);

  var v4 = C<Never>.constr1;
  var v6 = (C.constr1)<Never>;
  Expect.equals(v4, v6);
  Expect.identical(v4, v6);

  const v7 = C<Null>.constr2;
  const v9 = (C.constr2)<Null>;
  Expect.equals(v7, v9);
  const CheckIdentical(v7, v9);

  var v10 = C<List>.constr3;
  var v12 = (C.constr3)<List>;
  Expect.equals(v10, v12);
  Expect.identical(v10, v12);

  var v13 = C<Object?>.constr4;
  var v15 = (C.constr4)<Object?>;
  Expect.equals(v13, v15);
  Expect.identical(v13, v15);
}
