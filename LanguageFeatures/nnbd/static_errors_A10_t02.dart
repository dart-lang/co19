/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call the default List constructor with a length
 * argument and a type argument which is potentially non-nullable.
 *
 * @description Check that it is no error to call the default List constructor
 * without a length argument or a type argument which is not potentially
 * non-nullable.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class A {}

class C<X extends A?> {
  X x;
  C(this.x);

  test() {
    List l1 = new List<X>();
    List l2 = new List<A?>(3);
  }
}

main() {
  A? a = new A();
  C<A?> c = new C<A?>(a);
  c.test();
}
