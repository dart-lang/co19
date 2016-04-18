/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Assignment       ??=                                 Right          1
 * @description Test that '??=' assignment operator has lowest precedence.
 * Compare with cascade '..' (precedence 2) and conditional 'e1 ? e2 : e3'
 * (precedence 3) operators
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

String log = "";

class C {
  int get s1 => null;
  int get s2 => -1;

  void set s1(int val) {
    log += val.toString();
  }
  void set s2(int val) {
    log += val.toString();
  }
}

main() {
  C c = new C();
  c .. s1 ??= 2 .. s1 ??= 1 .. s2 ??= 3;
  Expect.equals("21", log);

  log = "";
  c.s1 ??= 1 == 2 ? 2 : 3;
  Expect.equals("3", log);

  log = "";
  c.s2 ??= 1 == 2 ? 2 : 3;
  Expect.equals("", log);
}
