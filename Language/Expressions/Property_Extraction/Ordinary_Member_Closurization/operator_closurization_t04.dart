/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let o be an object, and let u be a fresh final variable bound
 * to o. The closurization of method f on object o is defined to be equivalent
 * to:
 * • (a){return u op a;} if f is named op and op is one of <, >, <=, >=, ==,
 * -, +, /,  ̃/, *, %, |, ˆ, &, <<, >> (this precludes closurization of unary
 * -).
 *
 * @description Check that closurization of operator >= on object o is
 * equivalent to (a) {return u >= a;}
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  int operator >=(var v) {
    return v - 1;
  }
}

main() {
  C o = new C();
  var f = o#>=;

  var f1 = (a) {return o >= a;};

  Expect.equals(f(1), f1(1));
  Expect.equals(f(-1), f1(-1));
  Expect.equals(f(0), f1(0));
  Expect.notEquals(f(1), f1(2));
}
