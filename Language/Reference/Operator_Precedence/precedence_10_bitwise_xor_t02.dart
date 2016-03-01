/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Bitwise XOR      ˆ                                 Left          10
 * @description Test that '^' bitwise operator has left associativity
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

String log = "";

class C {
  String id = "";

  C operator ^(C val) {
    log += id;
    return val;
  }

  C(this.id);
}

main() {
  C c1 = new C("c1");
  C c2 = new C("c2");
  C c3 = new C("c3");
  C c4 = new C("c4");

  C c = c1 ^ c2 ^ c3 ^ c4;
  Expect.equals("c4", c.id);
  Expect.equals("c1c2c3", log);
}
