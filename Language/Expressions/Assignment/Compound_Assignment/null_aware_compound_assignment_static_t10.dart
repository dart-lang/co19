/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A compound assignment of the form C?.v op= e2 is equivalent to
 * the expression C.v op= e2.
 * @description Checks that an expression of the of the form C?.v ^= e2 is
 * equivalent to the expression C.v ^= e2.
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  static int _v;
  static int getterInvocation = 0;
  static int setterInvocation = 0;

  static void init(val) {
    _v = val;
    getterInvocation = 0;
    setterInvocation = 0;
  }

  static get v {
    ++getterInvocation;
    return _v;
  }

  static set v(val) {
    ++setterInvocation;
    _v = val;
  }
}

main() {
  Expect.throws(() {C.v ^= 2;});
  Expect.equals(1, C.getterInvocation);
  Expect.equals(0, C.setterInvocation);

  C.init(null);
  Expect.throws(() {C?.v ^= 2;});
  Expect.equals(1, C.getterInvocation);
  Expect.equals(0, C.setterInvocation);

  C.init(14);
  var res3 = (C?.v ^= 7);
  Expect.equals(1, C.getterInvocation);
  Expect.equals(1, C.setterInvocation);
  Expect.equals(9, res3);
  Expect.equals(9, C.v);
}
