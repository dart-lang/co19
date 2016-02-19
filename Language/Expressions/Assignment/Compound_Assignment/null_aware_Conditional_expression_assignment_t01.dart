/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a compound assignment of the form e1?.v ??= e2 is
 * equivalent to the evaluation of the expression
 * ((x) => x == null ? null: x.v?? = e2)(e1) where x is a variable that is not
 * used in e2.
 * @description Checks that in expression of the form e1?.v ??= e value is set
 * only if e1.v == null and returns null if e1 == null
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  var v = null;
}

main() {
  C c = null;
  var res = (c?.v ??= 1);
  Expect.isNull(res);
  Expect.isNull(c);

  c = new C();
  res = (c?.v ??= 2);
  Expect.equals(2, res);
  Expect.equals(2, c.v);

  res = (c?.v ??= 3);
  Expect.equals(2, res);
  Expect.equals(2, c.v);
}
