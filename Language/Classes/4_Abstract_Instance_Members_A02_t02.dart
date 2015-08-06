/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Invoking an abstract method, getter or setter results in an invocation of
 *  noSuchMethod exactly as if the declaration did not exist, unless a suitable member
 *  a is available in a superclass, in which case a is invoked.
 * @description Checks that NoSuchMethodError is thrown when calling an abstract method
 *  that is inherited from non-direct superclass.
 * @static-warning
 * @author vasya
 * @reviewer iefremov
 * @reviewer rodionov
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";
abstract class A {
  m1();
}

abstract class A1 extends A {}
abstract class A2 extends A1 {}
class C extends A2 { /// static type warning Concrete class has unimplemented member
}

main() {
  try {
    new C().m1();
    Expect.fail("NoSuchMethodError expected when calling abstract method or superclass.");
  } on NoSuchMethodError catch (ex) {}
}

