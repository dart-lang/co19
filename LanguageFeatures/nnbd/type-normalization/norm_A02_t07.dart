/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * NORM(FutureOr<T>) =
 *  let S be NORM(T)
 *  if S is a top type then S
 *  if S is Object then S
 *  if S is Object* then S
 *  if S is Never then Future<Never>
 *  if S is Null then Future<Null>?
 *  else FutureOr<S>
 *
 * @description Checks that otherwise NORM(FutureOr<T>) = FutureOr<NORM(T)>.
 * Test that NORM(FutureOr<T??>) == FutureOr<T?> and
 * NORM(FutureOr<Never?>) == FutureOr<Null>
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import 'dart:async';

class T {}
class A<X> {}
class B<X> implements A<FutureOr<X?>> {}
class D<X> implements A<X> {}

class C1 extends B<T?> implements A<FutureOr<T?>> {}
class C2 extends B<Never?> implements A<FutureOr<Null>> {}

main() {
  new C1();
  new C2();
}
