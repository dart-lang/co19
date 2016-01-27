/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The closurization of method f with respect to superclass S is
 * defined to be equivalent to:
 * • (a){return super op a;} if f is named op and op is one of <, >, <=, >=,
 * ==, -, +, /, ˜/, *, %, |, ˆ, &, <<, >>
 *
 * @description Check that unary- cannot be closurised
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int operator -() {
    return -2;
  }
}

class C extends A {
  void test() {
    Expect.throws(() {var f = super#-;}, (e) => e is NoSuchMethodError);
  }
}

main() {
  C o = new C();
  o.test();
}
