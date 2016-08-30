/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a compound assignment of the form super.v ??= e is
 * equivalent to the evaluation of the expression
 * ((x) => x == null ? super.v = e : x)(super.v) where x is a fresh variable
 * that is not used in e.
 * @description Checks that in expression of the form super.v ??= e value is set
 * only if super.v == null
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  var v = null;
}

class C extends A {

  void test() {
    var res1 = (super.v ??= 1);
    Expect.equals(1, super.v);
    Expect.equals(1, res1);

    var res2 = (super.v ??= 2);
    Expect.equals(1, super.v);
    Expect.equals(1, res2);
  }
}

main() {
  new C().test();
}
