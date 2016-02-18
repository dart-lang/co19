/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Unary postfix  ., ?., e++, e–-, e1[e2], e1(), ()  None           16
 * @description Test that '?.' unary postfix operator has highest
 * precedence (16). Compare with Unary prefix (precedence 15). Test that
 * '?.' has priority higher than ~
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  String log = "";

  C operator ~() {
    log += "~";
    return this;
  }

  C e() {
    log += "m";
    return this;
  }
}

main() {
  C c = new C();
  ~c?.e();
  Expect.equals( "m~", c.log);

  C c2 = null;
  Expect.throws(() {~c2?.e();}, (e) => e is NoSuchMethodError);
}
