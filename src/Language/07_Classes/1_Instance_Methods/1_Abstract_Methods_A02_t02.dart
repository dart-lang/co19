/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Invoking an abstract method always results in a run-time error.
 * This may be NoSuchMethodError or a subclass, such as AbstractMethodError.
 * @description Checks that NoSuchMethodException is thrown when calling an abstract method
 * that is inherited from non-direct superclass.
 * @static-warning
 * @author vasya
 * @reviewer iefremov
 * @reviewer rodionov
 */
class A {
  abstract m1();
}

class A1 extends A {}
class A2 extends A1 {}
class C extends A2 {}

main() {
  try {
    new C().m1();
    Expect.fail("NoSuchMethodException expected when calling abstract method or superclass.");
  } catch (NoSuchMethodException ex) {}
}

