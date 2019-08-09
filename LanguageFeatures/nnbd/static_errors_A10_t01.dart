/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call the default List constructor with a length
 * argument and a type argument which is potentially non-nullable.
 *
 * @description Check that it is an error to call the default List constructor
 * with a length argument and a type argument which is potentially non-nullable.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class A {}

class C<X extends A?> {
  X x;
  C(this.x);

  test() {
    List l1 = new List<X>(1);   //# 01: compile-time error
    List l2 = new List<X>(0);   //# 02: compile-time error
}

main() {
  A? a = new A();
  C<A?> c = new C<A?>(a);
  c.test();
}
