/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error for a formal parameter to be declared late.
 *
 * @description Check that it is an error for a formal parameter to be declared
 * late. Test covariant formal parameters
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class A {}

class C {
  void m1(covariant late A x) {}                    //# 01: compile-time error
  void m2(A x, [covariant late A y]) {}             //# 02: compile-time error
  void m3(A x, {covariant late A y}) {}             //# 03: compile-time error

  void set(covariant late A x) {}                   //# 04: compile-time error
  C operator +(covariant late C other) => other;    //# 05: compile-time error
}

main() {
}
