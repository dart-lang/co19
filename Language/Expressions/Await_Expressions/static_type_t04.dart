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
 * await expression does no match with expected type. Expression e is Future<T>.
 *
 * @static-warning
 * @author a.semenov@unipro.ru
 */
import 'dart:async';

import '../../../Utils/expect.dart';
import '../../../Utils/dynamic_check.dart';
import '../../../Utils/async_utils.dart';


static_int(int x) => x;
static_bool(bool x) => x;

Future<bool> boolean(bool b) async => b;
Future<int> integer(int i) async => i;
Future<String> string(String s) async => s;
Future<Exception> exception(Exception e) async => e;

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
    check(() async => static_int(await boolean(true))),/// static type warning
    check(() async => static_int(await string('hello'))),/// static type warning
    check(() async => static_bool(await integer(1))),/// static type warning
    check(() async => static_bool(await string('abc'))),/// static type warning
  ];
  Future.wait(checks).then( (value) => asyncEnd() );
}
