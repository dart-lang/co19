/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The flatten function is modified as follows:
 *
 * [flatten(T)] is defined by cases on [T]:
 *
 *   if [T] is [S?] then [flatten(T) = flatten(S)?]
 *   otherwise if [T] is [S*] then [flatten(T) = flatten(S)*]
 *   otherwise if [T] is [FutureOr<S>] then [flatten(T) = S]
 *   otherwise [if T <: Future] then let [S] be a type such that [T <:
 *       Future<S>] and for all [R], if [T <: Future<R>] then [S <: R]; then
 *       [flatten(T) = S]
 *   otherwise [flatten(T) = T]
 *
 * @description Check that future flattening works correctly for [Future<Null>]
 * type dynamically and the expression cannot be non-null.
 *
 * Issue 41437
 * @author iarkh@unipro.ru
 */
// Requirements=nnbd-weak

import "dart:async";
import "../../../Utils/expect.dart";

dynamic getInt() => 1;

main() {
  asyncStart();
  Future<Null>(() => getInt()).then((value)
      { Expect.fail("Should not reach here!"); }, onError: (e) => asyncEnd());
}
