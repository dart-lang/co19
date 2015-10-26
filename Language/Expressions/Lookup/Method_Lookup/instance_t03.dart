/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The result of a lookup of a method m in object o with respect
 * to library L is the result of a lookup of method m in class C with respect
 * to library L, where C is the class of o.
 * 
 * @description Checks that result of a lookup of a method m in object o
 * is method m in class C, where C is class of o
 * 
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
}

class M {
  int m1() => 1;
}

class C extends A with M {
  int m2() => 2;
}

main() {
  C o = new C();

  Expect.equals(1, o.m1());
  Expect.equals(2, o.m2());
}
