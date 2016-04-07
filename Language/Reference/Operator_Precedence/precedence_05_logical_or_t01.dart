/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Logical OR        ||                                Left           5
 * @description Test that '||' logical OR operator has precedence (5).
 * Compare with if-null '??' operator (precedence 4). Test that '||' has
 * priority higher than '??'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

String log = "";

class C {
  bool m(String val) {
    log += val;
    return false;
  }
}

main() {
  C c = new C();

  c.m("c1") || c.m("c2") ?? c.m("c3") || c.m("c4");
  Expect.equals("c1c2", log);

  log = "";

  null ?? c.m("c3") || c.m("c4");
  Expect.equals("c3c4", log);
}

