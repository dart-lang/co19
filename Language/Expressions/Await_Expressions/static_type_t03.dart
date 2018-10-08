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
 * @description Check static type of await expression match with expected
 * type, so static type warnings are not issued. Expression e is Future<T>.
 *
 * @static-clean
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import '../../../Utils/expect.dart';

Future<bool> boolean(bool b) async => b;
Future<int> integer(int i) async => i;
Future<String> string(String s) async => s;
Future<Exception> exception(Exception e) async => e;


Future<bool> test() async {
  bool b = await boolean(true);
  int i = await integer(1);
  String s = await string('hello');
  Exception z = await exception(null);
  // use variables, so  dart analyzer is happy
  return b && i == 1 && s == 'hello' &&  z == null;
}

main() {
  asyncStart();
  test().then((value) => asyncEnd());
}
