/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A write to a field or variable which is marked final and late is a
 * runtime error unless the field or variable was declared with no initializer
 * expression, and there have been no previous writes to the field or variable
 * (including via an initializing formal or an initializer list entry).
 *
 * @description Check that if a final late variable is declared with no
 * initializer expression, and there have been no previous writes to it, then
 * write attempt to this field or variable is not an error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class A {
  late final String a1;
  late final String? a2;

  A(this.a1, this.a2);
}

class C {
  late final String c1;
  late final String? c2;

  C(String v1, String v2) : this.c1 = v1, this.c2 = v2;
}

main() {
  A a = new A("No woman", "no cry");
  Expect.equals("No woman", a.a1);
  Expect.equals("no cry", a.a2);

  C c = new C("No woman", "no cry");
  Expect.equals("No woman", c.c1);
  Expect.equals("no cry", c.c2);
}
