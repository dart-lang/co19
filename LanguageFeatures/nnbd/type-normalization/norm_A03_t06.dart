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
 * @description Checks that if NORM(T) is FutureOr<R> and R is not nullable then
 * NORM(T?) != FutureOr<R>
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import 'dart:async';
class A<X> {}
class B1<X> implements A<X> {}

class C1 extends B1<FutureOr<String>?> implements A<FutureOr<String>> {}
//    ^^
// [analyzer]unspecified
// [cfe] unspecified
main() {
  new C1();
}
