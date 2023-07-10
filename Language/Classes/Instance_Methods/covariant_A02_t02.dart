// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each parameter p of m where covariant is present, it is a
/// compile-time error if there exists a direct or indirect superinterface of C
/// which has an accessible method signature m′′ with the same name as m, such
/// that m′′ has a parameter p′′ that corresponds to p, unless the type of p is
/// a subtype or a supertype of the type of p′′
///
/// @description Checks runtime type of a tear-off of a method with a covariant
/// parameter
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

class A {
  void m1(Object a) {}
  void m2([num a = 0]) {}
  void m3({Object a = 0}) {}
  void m4({required num a}) {}
}

class C extends A {
  void m1(covariant int a) {}
  void m2([covariant int a = 1]) {}
  void m3({covariant int a = 1}) {}
  void m4({required covariant int a}) {}
}

main() {
  C c = C();
  Expect.isTrue(c.m1 is void Function(Object?));
  Expect.isTrue(c.m2 is void Function([Object?]));
  Expect.isTrue(c.m3 is void Function({Object? a}));
  Expect.isTrue(c.m4 is void Function({required Object? a}));
}
