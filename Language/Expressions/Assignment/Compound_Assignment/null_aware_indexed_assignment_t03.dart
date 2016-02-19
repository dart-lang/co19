/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a compound assignment of the form e1[e2] ??= e3 is
 * equivalent to the evaluation of the expression
 * ((a, i) => ((x) => x == null ? a[i] = e3 : x)(a[i]))(e1, e2) where x, a and i
 * are distinct fresh variables that are not used in e3.
 * @description Checks that a compound assignment of the form e1[e2] ??= e3 is
 * equivalent to the evaluation of the expression
 * ((a, i) => ((x) => x == null ? a[i] = e3 : x)(a[i]))(e1, e2) where x, a and i
 * are distinct fresh variables that are not used in e3.
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  int v;
  int getterInvocation = 0;
  int setterInvocation = 0;

  C(val) {
    v = val;
  }

  operator [](idx) {
    ++getterInvocation;
    return idx == 0 ? null : idx;
  }

  void operator []=(idx, val) {
    ++setterInvocation;
    v = val;
  }
}

main() {
  C c1 = new C(null);
  var res1 = (c1[1 - 1] ??= 1);
  Expect.equals(1, c1.v);
  Expect.equals(1, c1.getterInvocation);
  Expect.equals(1, c1.setterInvocation);
  Expect.equals(1, res1);

  C c2 = new C(1);
  var res2 = (c2[1 + 1] ??= 3);
  Expect.equals(1, c2.v);
  Expect.equals(1, c2.getterInvocation);
  Expect.equals(0, c2.setterInvocation);
  Expect.equals(2, res2);
}
