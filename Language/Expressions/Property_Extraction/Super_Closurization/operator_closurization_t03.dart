/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionThe closurization of method f with respect to superclass S is
 * defined to be equivalent to:
 * • (a){return super op a;} if f is named op and op is one of <, >, <=, >=,
 * ==, -, +, /, ˜/, *, %, |, ˆ, &, <<, >>
 *
 * @description Check that closurization of operator <= of the superclass is
 * equivalent to (a) {return super <= a;}
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int operator <=(var v) {
    return v - 1;
  }
}

class C extends A {
  void test() {
    var f1 = super#<=;
    var f2 = (a) {return super <= a;};

    Expect.equals(f1(1), f2(1));
    Expect.equals(f1(-1), f2(-1));
    Expect.notEquals(f1(1), f2(2));
  }
}

main() {
  C o = new C();
  o.test();
}
