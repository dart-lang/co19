/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a compound assignment of the form e1?.v op = e2 is
 * equivalent to ((x) => x?.v = x.v op e2)(e1) where x is a variable that is not
 * used in e2.
 * @description Checks that an expression of the form e1?.v |= e2 is equivalent
 * to ((x) => x?.v = x.v | e2)(e1) where x is a variable that is not used in e2.
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
  var res1 = (c1?.v |= 2);
  Expect.isNull(res1);
  Expect.isNull(c1);

  C c2 = new C(null);
  Expect.throws(() {c2?.v |= 2;});

  C c3 = new C(14);
  var res3 = (c3?.v |= 7);
  Expect.equals(1, c3.getterInvocation);
  Expect.equals(1, c3.setterInvocation);
  Expect.equals(15, res3);
  Expect.equals(15, c3.v);
}
