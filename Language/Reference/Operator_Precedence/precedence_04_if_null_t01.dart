/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * If-null           ??                               Left             4
 * @description Test that '??' if-null operator has precedence (4).
 * Compare with conditional '? :' operator (precedence 3). Test that '??' has
 * priority higher than '? :'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

String log = "";

class C {
  getNull(String val) {
    log += val;
    return null;
  }

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

  var v = c.getNull("c0") ?? c.getTrue("c1") ? c.getTrue("c2") : c.getFalse("c3");
  Expect.isTrue(v);
  Expect.equals("c0c1c2", log);

  log = "";

  v = c.getFalse("c0") ? c.getNull("c1") : c.getNull("c2") ??
      c.getTrue("c3") ? c.getTrue("c4") : c.getFalse("c5");
  Expect.isTrue(v);
  Expect.equals("c0c2c3c4", log);
}

