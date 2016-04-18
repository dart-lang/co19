/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Assignment       /=                                 Right          1
 * @description Test that '/=' assignment operator has lowest precedence.
 * Compare with cascade '..' (precedence 2) and conditional 'e1 ? e2 : e3'
 * (precedence 3) operators
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

String log = "";

class C {
  double get s => 6.0;

  void set s(double val) {
    log += val.ceil().toString();
  }
}

main() {
  C c = new C();
  c .. s /= 2 .. s /= 3;
  Expect.equals("32", log);

  log = "";

  c.s /= 1.0 == 2.0 ? 2.0 : 3.0;
  Expect.equals("2", log);
}
