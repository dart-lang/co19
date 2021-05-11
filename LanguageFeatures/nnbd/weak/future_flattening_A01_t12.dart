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
/// @description Checks the type of [await] expression: neither compile nor
/// runtime errors is not thrown in nnbd-weak mode if [A] is a legacy class,
/// synchronous function returns a value of [Future<A>] type which is set to
/// [null].
///
/// @Issue https://github.com/dart-lang/language/pull/941
/// @Issue https://github.com/dart-lang/co19/issues/703
/// @Issue https://github.com/dart-lang/co19/issues/785
/// @Issue 41266,41437,42236,42237
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "dart:async";
import "../../../Utils/expect.dart";
import "future_flattening_legacy_lib.dart";

dynamic getNull() => null;

Future<A> test() async => await getNull();

main() {
  asyncStart();
  test().then((value) => asyncEnd());
}
