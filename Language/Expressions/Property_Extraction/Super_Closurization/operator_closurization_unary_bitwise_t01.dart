/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The closurization of method f with respect to superclass S is
 * defined to be equivalent to:
 * ...
 * • (){return ˜super;} if f is named ˜
 *
 * @description Check that closurization of operator ~ on the superclass is
 * equivalent to () {return ~super;}
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int value;

  int operator ~() {
    return ~value;
  }
}

class C extends A {
  void test() {
    var f1 = super#~;
    var f2 = () {return ~super;};

    super.value = 1;
    Expect.equals(f1(), f2());
    super.value = 0;
    Expect.equals(f1(), f2());
    super.value = -4;
    Expect.equals(f1(), f2());
    super.value = 13;
    Expect.equals(f1(), f2());
  }
}

main() {
  C o = new C();
  o.test();
}
