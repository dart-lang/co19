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
 * @description Checks that if NORM(T) is Object* then
 * NORM(FutureOr<T>) = Object*
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import 'opted_out_lib.dart';

class C extends LFO implements LAO {}

main() {
  new C();
}
