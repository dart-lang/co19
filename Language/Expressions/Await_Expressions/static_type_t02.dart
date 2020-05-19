/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a is flatten(T) (the flatten function is
 * defined in section 'Function Expressions' where T is the static type of e.
 *
 * @assertion flatten(T) is defied as follows:
 *    If T = Future<S> then flatten(T) = flatten(S).
 *    Otherwise if T <: Future then let S be a type such that T << Future<S>
 *  and for all R, if T << Future<R> then S << R.
 *    This ensures that Future <S> is the most specific instantiation of
 * Future that is a super type of T.
 *    Then flatten(T) = S.
 *    In any other circumstance, flatten(T) = T.
 *
 * @description Check that it is a compile error if static type of
 * await expression does no match with expected type.
 * @compile-error
 * @author a.semenov@unipro.ru
 */

static_int(int x) => x;

main() {
  var f = () async => static_int(await true);
}
