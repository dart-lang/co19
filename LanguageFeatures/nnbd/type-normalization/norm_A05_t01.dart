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
 * @description Checks that if NORM(T) is Never then NORM(X extends T) = Never
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A<X> {}
class B<X extends Never> implements A<X> {}

class C extends B<Never> implements A<Never> {}

main() {
  new C();
}
