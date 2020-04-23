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
 * @description Checks that if NORM(T) is a top type then NORM(FutureOr<T>) =
 * NORM(T)
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import 'dart:async';

class A<X> {}
class B<X> implements A<X> {}

class CD1 extends B<FutureOr<dynamic>> implements A<dynamic> {}
class CD2 extends B<FutureOr<dynamic>> implements A<dynamic?> {}

class CO extends B<FutureOr<Object?>> implements A<Object?> {}
class CV extends B<FutureOr<void>> implements A<void> {}

main() {
  new CD1();
  new CD2();
  new CO();
  new CV();
}
