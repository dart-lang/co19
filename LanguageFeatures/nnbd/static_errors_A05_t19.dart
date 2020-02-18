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
 * @description Check that it is an error if a class declaration declares an
 * instance variable with a potentially non-nullable type and no initializer
 * expression, and the class has a generative constructor where the variable is
 * not initialized via an initializing formal or an initializer list entry,
 * unless the variable is marked with the late modifier.
 * Test <T extends Object?>
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {}

class C1<T extends Object?> {
  T t;
  C1(T t): this.t = t {}
}

class C2<T extends Object?> {
  T t;
  C2(this.t);
}

main() {
  new C1<A>(new A());
  new C2<A>(new A());

  new C1<String>("Show must go on");
  new C2<String>("Lily was here");
}
