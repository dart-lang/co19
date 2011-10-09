/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The first implicit action of a constructor is to call the super constructor 
 * (unless the constructor is in Object).
 * @description Checks that super constructor is called implicitly.
 * @author iefremov
 * @reviewer msyabro
 * @needsreview According to earlier assertions initialization of super class can be anywhere 
 * in the initializer list and initializers are executed in order they are written 
 */ 

class A {
  A() : ok = 1 { ok = 2;}
  int ok;
}

class B extends A {
  B() {}
}


void main() {
  B b = new B();
  Expect.isTrue(b.ok == 2);
}
