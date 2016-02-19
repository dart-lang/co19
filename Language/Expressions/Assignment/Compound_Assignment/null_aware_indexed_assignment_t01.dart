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
 * @description Checks that in expression of the form e1.[e2] ??= e3 value is
 * set only if e1[e2] == null
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  var v;

  operator [](idx) {
    return idx == 0 ? null : idx;
  }

  void operator []=(idx, val) {
    v = val;
  }
}

main() {
  C c = new C();
  c[1 - 1] ??= 1;
  Expect.equals(1, c.v);

  c[1 + 1] ??= 2;
  Expect.equals(1, c.v);
}
