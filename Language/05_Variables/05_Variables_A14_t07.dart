/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A non-final variable declaration of the form T v;
 * or the form T v = e; always induces an implicit setter function 
 * with signature
 *   void set v = (T x)
 * whose execution sets the value of v to the incoming argument x.
 * @description For all types of forms checks that setter execution sets the
 * value of the variable and that parameter type is T.
 * @static-clean
 * @author ilya
 */
import "../../Utils/expect.dart";

class A {}
  
//--library static variables
A x1;
A x2 = new A();

class C {
  //--instance variables
  A y1;
  A y2 = new A();
  
  //--class static variables
  static A z1;
  static A z2 = new A();
}

main() {
  A a = new A();
  x1 = a; Expect.identical(x1, a);
  x2 = a; Expect.identical(x2, a);

  C c = new C();
  
  c.y1 = a; Expect.identical(c.y1, a);
  c.y2 = a; Expect.identical(c.y2, a);

  C.z1 = a; Expect.identical(C.z1, a);
  C.z2 = a; Expect.identical(C.z2, a);
}
