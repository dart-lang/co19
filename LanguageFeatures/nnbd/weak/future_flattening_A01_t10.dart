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
/// @description Checks that type of await expression matches with the expected
/// non-nullable legacy types statically and the expression cannot be null.
///
/// @description Check that type of `await` expression match with expected type
/// dynamically for the custom legacy class type parameter and the expression can
/// be `null` in weak mode.
///
/// Here is a situation where sound and non-sound null checking produce different
/// results. The `null` value is tested using `null as A`, and such a cast
/// succeeds. So `test()` does not throw error and returns `Future<A>` that will
/// be completed with `null`. No dynamic error here.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "dart:async";
import "future_flattening_legacy_lib.dart";

Future<A> test() async {
  A a = await (null as A);
  return new Future<A>.value(new A());
}

main() {}
