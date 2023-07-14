// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each parameter p of m where covariant is present, it is a
/// compile-time error if there exists a direct or indirect superinterface of C
/// which has an accessible method signature m′′ with the same name as m, such
/// that m′′ has a parameter p′′ that corresponds to p, unless the type of p is
/// a subtype or a supertype of the type of p′′
///
/// @description Test that the actual argument is subject to a dynamic type
/// check with the type of the parameter as declared in the actually running
/// implementation.
/// @author sgrekhov22@gmail.com
/// @issue 52935

import "../../../Utils/expect.dart";

class A {
  void m1(Object a) {}
  void m2([Object a = 0]) {}
  void m3({Object a = 0}) {}
  void m4({required Object a}) {}
}

class C extends A {
  void m1(covariant int a) {}
  void m2([covariant int a = 1]) {}
  void m3({covariant int a = 1}) {}
  void m4({required covariant int a}) {}
}

main() {
  C c = C();
  dynamic d1 = c.m1;
  Expect.throws(() {
    d1(Object());
  });
  d1(42);
  dynamic d2 = c.m2;
  Expect.throws(() {
    d2(Object());
  });
  d2(42);
  dynamic d3 = c.m3;
  Expect.throws(() {
    d3(a: Object());
  });
  d3(a: 42);
  dynamic d4 = c.m4;
  Expect.throws(() {
    d4(a: Object());
  });
  d4(a: 42);
}
