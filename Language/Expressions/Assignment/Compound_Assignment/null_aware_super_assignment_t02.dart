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
 * @description Checks that a compound assignment of the form super.v ??= e is
 * equivalent to the evaluation of the expression
 * ((x) => x == null ? super.v = e : x)(super.v) where x is a fresh variable
 * that is not used in e.
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int _v;
  int getterInvocation;
  int setterInvocation;

  A(val) {
    _v = val;
    getterInvocation = 0;
    setterInvocation = 0;
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

class C extends A {
  C(val) : super(val);

  void test(var val, expected, setterInvCount) {
    var res = (super.v ??= val);
    Expect.equals(1, getterInvocation);
    Expect.equals(setterInvCount, setterInvocation);
    Expect.equals(expected, super.v);
    Expect.equals(expected, res);
  }
}

main() {
  new C(null).test(1, 1, 1);
  new C(1).test(2, 1, 0);
}
