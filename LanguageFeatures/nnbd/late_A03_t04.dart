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
import "../../Utils/expect.dart";

class A1 {
  covariant late String v;
  A1() : this.v = ((this.v = "Lily") == "lily" ? "was": "here");
}

class A2 {
  covariant late String v;
  A2() : this.v = ((this.v = "Lily") == "lily" ? "was": "here");
}

class C1 {
  late String v;
  C1() : this.v = ((this.v = "Lily") == "lily" ? "was": "here");
}

class C2 {
  late String v;
  C2() : this.v = ((this.v = "Lily") == "lily" ? "was": "here");
}

main() {
  Expect.equals("here", new A1().v);
  Expect.equals("here", new A2().v);
  Expect.equals("here", new C1().v);
  Expect.equals("here", new C2().v);
}
