/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * NORM(T?) =
 *  let S be NORM(T)
 *  if S is a top type then S
 *  if S is Never then Null
 *  if S is Never* then Null
 *  if S is Null then Null
 *  if S is FutureOr<R> and R is nullable then S
 *  if S is FutureOr<R>* and R is nullable then FutureOr<R>
 *  if S is R? then R?
 *  if S is R* then R?
 *  else S?
 *
 * @description Checks that if NORM(T) is a top type then NORM(T?) = NORM(T)
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class A<X> {}
class B1<X> implements A<X> {}
class B2<X> implements A<X?> {}

class CD extends B1<dynamic?> implements A<dynamic> {}
class CO extends B1<Object?> implements A<Object?> {}
class CV extends B2<void> implements A<void> {}

main() {
  new CD();
  new CO();
  new CV();
}
