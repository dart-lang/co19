/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a top level variable, static variable, or
 * instance field with potentially non-nullable type has no initializer
 * expression and is not initialized in a constructor via an initializing formal
 * or an initializer list entry, unless the variable or field is marked with the
 * 'late' modifier.
 *
 * @description Check that it is no compile-time error if an instance field
 * with potentially non-nullable type has no initializer expression but
 * initialized in a constructor via an initializing formal or an initializer
 * list entry. Test <T extends Object?>
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
