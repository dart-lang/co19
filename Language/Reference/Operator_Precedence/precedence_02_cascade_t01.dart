/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Cascade          ..                                Left          2
 * @description Test that '..' cascade operator has left associativity.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

String log = "";

class C {
  m(String val) {
    log += val;
  }
}

main() {
  C c = new C();
  c .. m("c1") .. m("c2") .. m("c3") .. m("c4");
  Expect.equals("c1c2c3c4", log);
}
