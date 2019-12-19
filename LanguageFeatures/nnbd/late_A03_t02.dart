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
 * Evaluating the initializer expression may validly cause a write to the field
 * or variable, assuming that the field or variable is not final. In this case,
 * the variable assumes the written value. The final value of the initializer
 * expression overwrites any intermediate written values.
 *
 * @description Check that evaluating the initializer expression may validly
 * cause a write to the field or variable, assuming that the field or variable
 * is not final. In this case, the variable assumes the written value. The final
 * value of the initializer expression overwrites any intermediate written
 * values.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  static String initS(String val1, String val2) {
    s = val1;
    return val2;
  }
  static late String? s = initS("No woman", "no cry");

  covariant late String? v1 = initV1("No woman", "no cry");
  late String? v2 = initV2("No woman", "no cry");

  initV1(String val1, String val2) {
    v1 = val1;
    return val2;
  }

  initV2(String val1, String val2) {
    v2 = val1;
    return val2;
  }
}

late String? g = initG("No woman", "no cry");

initG(String val1, String val2) {
  g = val1;
  return val2;
}

main() {
  Expect.equals("no cry", C.s);
  Expect.equals("no cry", g);
  C c = new C();
  Expect.equals("no cry", c.v1);
  Expect.equals("no cry", c.v2);
}
