// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
 * @description Checks that async function with `Future<FutureOr<Never>>` return
 * type cannot return null in the weak mode.
 *
 * We'll have to keep this one on a waiting list, blocked by
 * https://github.com/dart-lang/language/issues/1346 (or some issue that can be
 * found looking at 1346, if the discussion is taken somewhere else, say
 * https://github.com/dart-lang/sdk/issues/44246).
 *
 * @Issue 41324, 41437
 * @Issue https://github.com/dart-lang/language/issues/1346
 * @author iarkh@unipro.ru
 */
// Requirements=nnbd-weak

import "dart:async";
import "../../../Utils/expect.dart";

dynamic getNull() => null;

Future test() async {
  FutureOr<Never> i = await getNull();
  return i;
}

main() {
  asyncStart();
  test().then((value) { Expect.fail("Should not reach here!"); },
      onError:(e) => asyncEnd());
}
