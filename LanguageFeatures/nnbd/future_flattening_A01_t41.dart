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
/// @description Check that type of await expression match with expected
/// [FutureOr<Object>] type dynamically and the expression cannot be null.
/// @author iarkh@unipro.ru
/// @Issue 41272,41437

import "dart:async";
import "../../Utils/expect.dart";

dynamic getNull() => null;

Future<FutureOr<Object>> test() async {
  FutureOr<Object> o = await getNull();
  return o;
}

main() {
  asyncStart();
  test().then((value) {  Expect.fail("Should not reach here!"); },
      onError:(e) => asyncEnd());
}
