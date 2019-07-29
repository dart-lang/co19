/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Inside an extension method body, this does not refer to an
 * instance of a surrounding type. Instead it is bound to the original receiver,
 * and the static type of this is the declared on type of the surrounding
 * extension (which may contain unbound type variables).
 *
 * @description Check that inside an extension method body 'this' refers  to the
 * original receiver
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class A {
  String a;
  A(this.a);
}

class C extends A {
  String c;
  C(this.c, String a): super(a);
}

extension ExtendedC on C {
  void test(C c) {
    Expect.equals("c", this.c);
    Expect.equals("a", this.a);
    Expect.isTrue(this == c);
  }
}

main() {
  C c = new C("c", "a");
  c.test(c);
}
