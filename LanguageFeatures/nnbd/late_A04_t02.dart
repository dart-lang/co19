/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A read of a field or variable which is marked as late which has
 * not yet been written to causes the initializer expression of the variable to
 * be evaluated to a value, assigned to the variable or field, and returned as
 * the value of the read.
 * ...
 * Evaluating the initializer expression may cause an exception to be thrown. If
 * the variable was written to before the exception was thrown, the value of the
 * variable on subsequent reads is the last written value. If the variable was
 * not written before the exception was thrown, then the next read attempts to
 * evaluate the initializer expression again.
 *
 * @description Check that if evaluating of the initializer expression throws an
 * exception then the value of the variable is the last written value
 * @author sgrekhov@unipro.ru
 * @issue 38734
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  static String initS(String val1, String val2) {
    s = val1;
    throw new Exception();
  }
  static late String? s = initS("No woman", "no cry");

  covariant late String? v1 = initV1("No woman", "no cry");
  late String? v2 = initV2("No woman", "no cry");

  initV1(String val1, String val2) {
    v1 = val1;
    throw new Exception();
  }

  initV2(String val1, String val2) {
    v2 = val1;
    throw new Exception();
  }
}

late String? g = initG("No woman", "no cry");

initG(String val1, String val2) {
  g = val1;
  throw new Exception();
}

main() {
  Expect.throws(() {C.s;});
  Expect.equals("No woman", C.s);
  Expect.throws(() {g;});
  Expect.equals("No woman", g);
  C c = new C();
  Expect.throws(() {c.v1;});
  Expect.equals("No woman", c.v1);
  Expect.throws(() {c.v2;});
  Expect.equals("No woman", c.v2);
}
