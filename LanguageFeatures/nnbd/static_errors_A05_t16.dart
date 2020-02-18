/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a class declaration declares an instance
 * variable with a potentially non-nullable type and no initializer expression,
 * and the class has a generative constructor where the variable is not
 * initialized via an initializing formal or an initializer list entry, unless
 * the variable is marked with the late modifier.
 *
 * @description Check that it is no compile-time error if an instance variable
 * with a potentially non-nullable type has no initializer expression but
 * initialized in a constructor via an initializing formal or an initializer
 * list entry. Test some class A
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {}

class C1 {
  A a;
  C1(A a): this.a = a {}
}

class C2 {
  A a;
  C2(this.a);
}

main() {
  new C1(new A());
  new C2(new A());
}
