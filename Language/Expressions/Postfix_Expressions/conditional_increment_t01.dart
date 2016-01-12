/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a postfix expression of the form e1?.v++ is
 * equivalent to executing ((x) => x == null? null: x.v++)(e1) unless e1 is
 * a type literal, in which case it is equivalent to e1.v++
 * @description Checks that evaluation of an expression of the form  e1?.v++ is
 * equivalent to executing ((x) => x == null? null: x.v++)(e1)
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  int v = 0;
}

main() {
  C c1 = null;
  Expect.equals(c1?.v++, null);

  C c2 = new C();
  Expect.equals(c2?.v++, 0);
  Expect.equals(c2?.v, 1);
}
