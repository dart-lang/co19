/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A compound assignment of the form C?.v ??= e2 is equivalent to the
 * expression C.v ??= e.
 * @description Checks that an expression of the form C?.v ??= e is equivalent
 * to the expression C.v ??= e (in other words
 * ((x) => x == null? C.v = e : x)(C.v) where x is a fresh variable that is not
 * used in e)
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
  C.init(null);
  var res = (C?.v ??= 1);
  Expect.equals(1, C.getterInvocation);
  Expect.equals(1, C.setterInvocation);
  Expect.equals(1, C.v);
  Expect.equals(1, res);

  C.init(1);
  res = (C?.v ??= 2);
  Expect.equals(1, C.getterInvocation);
  Expect.equals(0, C.setterInvocation);
  Expect.equals(1, C.v);
  Expect.equals(1, res);
}
