/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration of one of the forms
 * T v;, T v = e; , const T v = e;, final T v; or final T v = e;
 * always induces an implicit getter function with signature
 *   T get v
 * whose invocation evaluates as described below.
 * @description For all types of forms checks that return type of getter is T
 * by expecting no static warnings.
 * @static-clean
 * @author ilya
 */

class A {
  const A();
}
  
//--library static variables
A x1;
A x2 = new A();
const A x3 = const A();
//final A x4; //can not be
final A x5 = new A();

class C {
  //--instance variables
  A y1;
  A y2 = new A();
  //const A y3 = const A(); //can not be
  final A y4;
  final A y5 = new A();
  
  //--class static variables
  static A z1;
  static A z2 = new A();
  static const A z3 = const A();
  //static final A z4; //can not be
  static final A z5 = new A();

  C() : y4 = new A();
}

main() {
  A res;
  
  res = x1;
  res = x2;
  res = x3;
  res = x5;

  C c = new C();

  res = c.y1;
  res = c.y2;
  res = c.y4;
  res = c.y5;
  
  res = C.z1;
  res = C.z2;
  res = C.z3;
  res = C.z5;
}
