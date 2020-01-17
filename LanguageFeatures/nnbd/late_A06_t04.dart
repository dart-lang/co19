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
 * write attempt to this field or variable is not an error, but the second
 * attempt of write to it is a runtime error
 * @author sgrekhov@unipro.ru
 * @issue 39802
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  static late final String s;
  late final String v;
}

late final String g;

main() {
  C.s = "No";
  Expect.equals("No", C.s);
  Expect.throws(() {C.s = "Lily was here";});

  C c = new C();
  c.v = "woman";
  Expect.equals("woman", c.v);
  Expect.throws(() {c.v = "Lily was here";});

  g = "no";
  Expect.equals("no", g);
  Expect.throws(() {g = "Lily was here";});
}
