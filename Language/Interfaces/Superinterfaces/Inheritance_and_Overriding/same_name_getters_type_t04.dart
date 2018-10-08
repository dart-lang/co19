/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We define inherited(J, K) to be
 * the set of members m such that all of the following hold:
 * • m is accessible to K and
 * • A is a direct superinterface of J and either
 * – A declares a member m or
 * – m is a member of inherited(A, K).
 * • m is not overridden by J.
 * ...
 * If some but not all of the mi, 1 ≤ i ≤ k are getters none of the mi are
 * inherited, and a static warning is issued.
 * Otherwise, if the static types T1,...,Tk of the members m1,...,mk are not
 * identical, then there must be a member mx such that Tx <: Ti, 1 ≤ x ≤ k for
 * all i ∈ 1..k, or a static type warning occurs.
 * @description Checks that if all inherited members with the same name are
 * methods and their static types are not identical, but there is a method
 * such that its type is subtype of types of all other methods then, anyway, a
 * compile error occurs
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

abstract class SI1 {
  int m1();
  int m2();
  List<int> m3();
  int m4();
}

abstract class SI2 {
  bool m1();
  double m2();
  List<String> m3();
  bool m4();
}

abstract class SI3 {
  Object m1(); // subtype of m1() in SI1 and SI2
  num m2();   // subtype of m2() in SI1 and SI2
  List m3();  // subtype of m3() in SI1 and SI2
  m4();       // subtype of m4() in SI1 and SI2
}

abstract class I implements SI1, SI2, SI3 {
}

main() {
  I i = null;
}
