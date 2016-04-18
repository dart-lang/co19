/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Assignment       =                                 Right          1
 * @description Test that '=' assignment operator has lowest precedence.
 * Compare with cascade '..' (precedence 2) and conditional 'e1 ? e2 : e3'
 * (precedence 3) operators
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

String log = "";

class C {
  void set s(String val) {
    log += val;
  }
}

main() {
  C c = new C();
  c .. s = "c1" .. s = "c2";
  Expect.equals("c1c2", log);

  log = "";

  c.s = "c0" == null ? "c1" : "c2";
  Expect.equals("c2", log);
}
