/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration,  interface declaration or type alias G may be generic.
 * typeParameter: identifier (extends type)? ;
 * typeParameters: '<' typeParameter (',' typeParameter)* '>' ;
 * @description Checks that class can be declared with formal type parameters.
 * @author pagolubev
 * @reviewer kaigorodov
 */

class A<T> {
  A(this.val) {}
  T val;
}

class B<T1, T2> {
  B(this.x, this.y) {}
  T1 x;
  T2 y;
}

main() {
  A<int> a = new A<int>(5);
  Expect.equals(5, a.val);

  A<String> a2 = new A<String>("s");
  Expect.equals("s", a2.val);

  B<String, double> b = new B<String, double>('1', .2);
  Expect.equals('1', b.x);
  Expect.equals(.2, b.y);

  B<double, String> b2 = new B<double, String>(.2, '1');
  Expect.equals(.2, b2.x);
  Expect.equals('1', b2.y);
}
