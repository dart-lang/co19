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
 * @description Check that it is a runtime error if initializing expression
 * writes an intermediate value to final field or variable
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  static late final String s;
  static void initS(String val) {
    s = val;
    Expect.throws(() {s = "Show must go on";},
            (e) => e is LateInitializationError);
  }

  late final String v;
  void initV(String val) {
    v = val;
    Expect.throws(() {v = "Show must go on";},
            (e) => e is LateInitializationError);
  }
}

late final String g;

void initG(String val) {
  g = val;
  Expect.throws(() {g = "Show must go on";},
          (e) => e is LateInitializationError);
}

main() {
  C.initS("Lily was here");
  Expect.equals("Lily was here", C.s);

  C c = new C();
  c.initV("Lily was here");
  Expect.equals("Lily was here", c.v);

  initG("Lily was here");
  Expect.equals("Lily was here", g);
}
