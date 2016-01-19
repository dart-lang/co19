/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a compound assignment of the form v ??= e is
 * equivalent to the evaluation of the expression
 * ((x) => x == null ? v = e : x)(v) where x is a fresh variable that is not
 * used in e
 * @description Checks that an expression of the form v ??= e is equivalent to
 * ((x) => x == null ? v = e : x)(v) where x is a fresh variable that is not
 * used in e
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

  test(value, expected, setterInvCount) {
    var res = (v ??= value);
    Expect.equals(1, getterInvocation);
    Expect.equals(setterInvCount, setterInvocation);
    Expect.equals(expected, v);
    Expect.equals(expected, res);
  }
}

main() {
  new C(null).test(1, 1, 1);
  new C(1).test(2, 1, 0);
}
