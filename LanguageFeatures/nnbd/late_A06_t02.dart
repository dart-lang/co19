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

class C {
  static late final String? s;
  late final String? v;
}

late final String? g;

main() {
  late final String? l;

  C.s = "No";
  Expect.equals("No", C.s);

  C c = new C();
  c.v = "woman";
  Expect.equals("woman", c.v);

  g = "no";
  Expect.equals("no", g);

  l = "cry";
  Expect.equals("cry", l);
}
