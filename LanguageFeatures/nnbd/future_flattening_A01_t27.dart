// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The flatten function is modified as follows:
///
/// [flatten(T)] is defined by cases on [T]:
///
///   if [T] is [S?] then [flatten(T) = flatten(S)?]
///   otherwise if [T] is [S*] then [flatten(T) = flatten(S)*]
///   otherwise if [T] is [FutureOr<S>] then [flatten(T) = S]
///   otherwise [if T <: Future] then let [S] be a type such that [T <:
///       Future<S>] and for all [R], if [T <: Future<R>] then [S <: R]; then
///       [flatten(T) = S]
///   otherwise [flatten(T) = T]
///
/// @description Check that type of [await] expression matches with expected
/// [Never] type dynamically and the expression cannot be non-null. Check that
/// compile error is not thrown if synchronous function with [Future<Never>]
/// return value type returns a value of the type [dynamic].
///
/// @Issue https://github.com/dart-lang/language/pull/941
/// @Issue https://github.com/dart-lang/co19/issues/703
/// @Issue 41266,41437,42236,42237
/// @author iarkh@unipro.ru

// Requirements=nnbd-strong

import "dart:async";
import "../../Utils/expect.dart";

dynamic getInt() => 1;

Future<Never> test() async => await getInt();

main() {
  asyncStart();
  test().then((value) {  Expect.fail("Should not reach here!"); },
      onError:(e) => asyncEnd());
}
