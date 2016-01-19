/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a compound assignment of the form e1.v ??= e2 is
 * equivalent to the evaluation of the expression
 * ((x) => ((y) => y == null ? x.v = e2 : y)(x.v))(e1) where x and y are
 * distinct fresh variables that are not used in e2.
 * @description Checks that an expression of the form e1.v ??= e2 is equivalent
 * to ((x) => ((y) => y == null ? x.v = e2 : y)(x.v))(e1) where x and y are
 * distinct fresh variables that are not used in e2.
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
  C c1 = new C(null);
  var res1 = (c1.v ??= 1);
  Expect.equals(1, c1.getterInvocation);
  Expect.equals(1, c1.setterInvocation);
  Expect.equals(1, c1.v);
  Expect.equals(1, res1);


  C c2 = new C(1);
  var res2 = (c2.v ??= 2);
  Expect.equals(1, c2.getterInvocation);
  Expect.equals(0, c2.setterInvocation);
  Expect.equals(1, c2.v);
  Expect.equals(1, res2);
}
