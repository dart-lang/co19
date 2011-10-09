/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In Dart, names in the lexical scope take precedence over names from superclasses.
 * @description Checks that a local method variable hides superclass' field with the same name.
 * @author msyabro
 * @reviewer pagolubev
 */
 
class A {
  var x;
  A():x = 2{}
}

class B extends A{
  B():super() {}
  int foo() {
    int x;
    x = 1;
    return x;
  }
}


void main() {
  B b = new B();
  Expect.isTrue(b.foo() == 1);
  Expect.isTrue(b.x == 2);
}
