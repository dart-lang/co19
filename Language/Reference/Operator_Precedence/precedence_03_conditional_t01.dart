/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Conditional      e1? e2: e3                         Right          3
 * @description Test that 'e1? e2: e3' conditional operator has right
 * associativity.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

String log = "";

class C {
  bool getTrue(String val) {
    log += val;
    return true;
  }

  bool getFalse(String val) {
    log += val;
    return false;
  }
}

main() {
  C c = new C();
  var v = c.getTrue("c0") ? c.getTrue("c1") ? c.getTrue("c2") : c.getTrue("c3")
      : c.getFalse("c4");
  Expect.isTrue(v);
  Expect.equals("c0c1c2", log);

  log = "";

  v = c.getTrue("c0") ? c.getTrue("c1") ? c.getFalse("c2") : c.getTrue("c3")
      : c.getFalse("c4");
  Expect.isFalse(v);
  Expect.equals("c0c1c2", log);
}
