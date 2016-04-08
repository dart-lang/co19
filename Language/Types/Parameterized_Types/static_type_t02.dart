/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If S is the static type of a member m of G, then the static type
 * of the member m of G <A1, ..., An> is [A1, ..., An/T1, ..., Tn]S where
 * T1, ..., Tn are the formal type parameters of G.
 * @description Checks that static type of member m G<T1, T2> is [T1, T2]S with
 * upper bounds specified
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

class A<T> {
}
class B {
}
class G<T1 extends num, T2 extends B> {
  A<T1> m1;
  A<T2> m2;
}

main() {
  G<int, B> c = new G<int, B>();
  A<int> a1 = c.m1;
  A<B> a2 = c.m2;
}
