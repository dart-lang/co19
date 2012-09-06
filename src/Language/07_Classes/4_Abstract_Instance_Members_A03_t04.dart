/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply to methods
 * apply to abstract methods.
 * 7.1: It is a compile-time error if an instance method m1 overrides (7.9.1) an
 * instance member m2 and m1 has a different number of required parameters than m2.
 * @description Checks that a compile-error is produced when an abstract method overrides
 * another abstract method with the same name and a different number of required parameters
 * even if the class declaring the second method is not a direct superclass of the other.
 * @compile-error
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
 * @needsreview issue 978
 */

class A {
  f(var x);
}

class Foo extends A {}

class C extends Foo {
  f(var x, var y);
}

main() {
  try {
    new C().f(2, 2);
  } catch (e) {}
  try {
    new A().f(2);
  } catch (e) {}
}

