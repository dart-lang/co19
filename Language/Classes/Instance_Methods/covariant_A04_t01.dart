// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each parameter p of m where covariant is present, it is a
/// compile-time error if there exists a direct or indirect superinterface of C
/// which has an accessible method signature m′′ with the same name as m, such
/// that m′′ has a parameter p′′ that corresponds to p, unless the type of p is
/// a subtype or a supertype of the type of p′′
///
/// @description Checks that tearing-off a method with a covariant-by-class
/// parameter strips a `covariant` keyword
/// @author sgrekhov22@gmail.com

import "../../../Utils/static_type_helper.dart";

class A<T> {
  void m1(T a) {}
  void m2({required T a}) {}
}

main() {
  A<num> a = A();
  a.m1.expectStaticType<Exactly<void Function(num)>>();
  a.m2.expectStaticType<Exactly<void Function({required num a})>>();
}
