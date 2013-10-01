/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function value, or an instance of a class with a "call" method, 
 * is a subtype of a function type, and as such, a subtype of Function.
 * @description Checks that function values and instances of classes with call(...) methods
 * are indeed subtypes of Function.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

class A {
  int call(int x, bool y) {
    return 11;
  }
}

class B extends A {}

int foo(String s) {
  return 21;
}

main() {
  Expect.isTrue(foo is Function);
  Expect.isTrue(new A() is Function);
  Expect.isTrue(new B() is Function);
  Expect.isTrue((int, double) {return 0;} is Function);
}
