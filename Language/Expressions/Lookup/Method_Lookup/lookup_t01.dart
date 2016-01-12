/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The result of a lookup of a method m in object o with respect to
 * library L is the result of a lookup of method m in class C with respect to
 * library L, where C is the class of o.
 * @description Checks that only the method in class C is found.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../../Utils/expect.dart';

class A {
  method() {Expect.fail("Wrong getter was invoked");}
}

class B {
  method() {Expect.fail("Wrong getter was invoked");}
}

class C {
  method() {throw "C"; }
}

main() {
  var o = new C();
  try {
    o.method();
    Expect.fail("Wrong method was called!");
  } on String catch (s) {
    Expect.equals("C", s, "Wrong method was called!");
  }
}
