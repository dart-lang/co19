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
 * @description Check that static type warning is issued, if static type of
 * await expression does no match with expected type.
 *
 * @static-clean
 * @author a.semenov@unipro.ru
 */
import 'dart:async';

import '../../../Utils/expect.dart';
import '../../../Utils/dynamic_check.dart';
import '../../../Utils/async_utils.dart';

static_int(int x) => x;
static_bool(bool x) => x;

check(f()){
  return f().then(
          (value) {
            if (isCheckedMode()){
              Expect.fail("Type error expected in checked mode");
            }
          },
          onError: (error) {
            Expect.isTrue(isCheckedMode() && (error is TypeError),
              'Unexpected error: $error');
          });
}

main() {
  asyncStart();
  List checks = [
    check( () async => static_int(await true) ), /// static type warning
    check( () async => static_int(await 'hello') ), /// static type warning
    check( () async => static_bool(await 1) ), /// static type warning
    check( () async => static_bool(await 'world') ), /// static type warning
  ];
  Future.wait(checks).then( (value) => asyncEnd() );
}
