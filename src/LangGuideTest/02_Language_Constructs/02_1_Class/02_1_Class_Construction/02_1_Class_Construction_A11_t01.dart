/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The initializers of a class are executed in the order they are written. 
 * Only after all initializers, including the ones of all super classes, have been 
 * executed, the constructors are invoked.
 * @description Checks proper initialization order.
 * @author iefremov 
 * @reviewer msyabro
 */ 


class Global {
  Global()  {}
  static StringBuffer checksum; 
}

class A {
  A() { Global.checksum.append("A"); }
}

class B extends A {
  B() : super() { Global.checksum.append("B");}
}

class Z {
  Z() {Global.checksum.append("Z");}
}

class C {
  C() : b = new B(), z = new Z() { Global.checksum.append("C");}
  
  B b;
  Z z;
}


void main() {
  Global.checksum = new StringBuffer();
  C c = new C();
  Expect.isTrue(Global.checksum.toString() == "ABZC");
}
