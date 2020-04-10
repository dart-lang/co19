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
 * @description Check that compile error is thrown if synchronous function with
 * [Future<FutureOr<Never>>] return value type returns a value of the type
 * [dynamic].
 *
 * Here is a comment from the Issue #41266:
 *
 * Section 9 of the spec says that it is a compile time error if:
 *
 *   The function is asynchronous, [flatten(T)] is not [void], and it would
 *   have been a compile-time error to declare the function with the body [async
 *   { return e; }] rather than [async => e] and the relevant passage of section
 *   17.12 is:
 *
 *   It is a compile-time error if [s] is [return e;], [flatten(S)] is not
 *   [void], and [Future<flatten(S)>] is not assignable to [T]
 *
 * Here [flatten(S)} is [dynamic] and [Future<dynamic>] is not assignable to
 * [Future<bool>] when the nnbd flag is enabled.
 *
 * If any changes are forthcoming in the spec we will open issues for
 * implementation when needed.
 *
 * @Issue 41266,41437
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "dart:async";

dynamic getInt() => 1;

Future<FutureOr<Never>> test() async => await getInt();
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
