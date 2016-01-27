/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The closurization of method f with respect to superclass S is
 *  defined to be equivalent to:
 * ...
 * • (a, b){return super[a]= b;} if f is named []=
 *
 * @description Check that closurization of operator []= on the superclass is
 * equivalent to (a, b) {return super[a]= b;}
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  var values = [1, 2, 3];
  operator []=(var a, b) {
    return values[a] = b;
  }
}

class C extends A {
  void test() {
    var f = super#[]=;
    var f1 = (a, b) {super[a] = b;};

    f(0, 10);
    Expect.equals(10, values[0]);
    values[0] = 1;
    f1(0, 10);
    Expect.equals(10, values[0]);

    f(1, 20);
    Expect.equals(20, values[1]);
    values[1] = 2;
    f1(1, 20);
    Expect.equals(20, values[1]);

    f(2, 30);
    Expect.equals(30, values[2]);
    values[2] = 3;
    f1(2, 30);
    Expect.equals(30, values[2]);
  }
}

main() {
  C o = new C();
  o.test();
}
