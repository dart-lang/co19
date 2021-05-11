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
/// @description Check that future flattening works correctly for non-nullable
/// `Future<int>` type dynamically and the expression can be null in the weak
/// mode.
///
/// Here is a situation where sound and non-sound null checking produce different
/// results. The `null` value is a result of `getNull()`, it's tested using `null
/// as int`, and such a cast succeeds. So, no dynamic error here and
/// `Future<int>` is returned.
///
/// @Issue 41340,41437
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "dart:async";
import "../../../Utils/expect.dart";

dynamic getNull() => null;

main() {
  asyncStart();
  Future f = Future<int>(() => getNull());
  f.then((value) => asyncEnd());

  asyncStart();
  f = Future<Future<int>>(() => getNull());
  f.then((value) => asyncEnd());
}
