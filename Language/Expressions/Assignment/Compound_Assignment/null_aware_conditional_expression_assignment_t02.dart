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
  int _v;
  int getterInvocation = 0;
  int setterInvocation = 0;

  C(val) {
    _v = val;
  }

  get v {
    ++getterInvocation;
    return _v;
  }

  set v(val) {
    ++setterInvocation;
    _v = val;
  }
}

main() {
  C c1 = null;
  var res1 = (c1?.v ??= 1);
  Expect.isNull(res1);
  Expect.isNull(c1);

  C c2 = new C(null);
  var res2 = (c2?.v ??= 2);
  Expect.equals(1, c2.getterInvocation);
  Expect.equals(1, c2.setterInvocation);
  Expect.equals(2, res2);
  Expect.equals(2, c2.v);

  C c3 = new C(-1);
  var res3 = (c3?.v ??= 3);
  Expect.equals(1, c3.getterInvocation);
  Expect.equals(0, c3.setterInvocation);
  Expect.equals(-1, res3);
  Expect.equals(-1, c3.v);
}
