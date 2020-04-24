/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * NORM(X extends T) =
 *  let S be NORM(T)
 *  if S is Never then Never
 *  else X extends T
 *
 * @description Checks that if NORM(T) is NORM(X extends T)
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class T {}
class T1 extends T {}
class T2 extends T {}
class A<X> {}
class B<X extends T> implements A<X> {}

class C extends B<T1> implements A<T1> {}

main() {
  new C();
}
