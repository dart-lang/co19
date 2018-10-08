/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion if e evaluates to an object o that is not an instance of Future,
 * then let f be the result of calling Future.value() with o as its argument;
 * otherwise let f be the result of evaluating e.
 *    Next, execution of the function m immediately enclosing a is suspended
 * until after f completes. The stream associated with the innermost enclosing
 * asynchronous for loop, if any, is paused. At some time after f is completed,
 * control returns to the current invocation. The stream associated with the
 * innermost enclosing asynchronous for loop , if any, is resumed. If f has
 * completed with an exception x, a raises x. If f completes with a value v,
 * a evaluates to v.
 *
 * @description Check that if e evaluates to an instance of Future f and f
 * completes with a value v, then await expression value equals to v.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

const String HELLO = 'hello';

Future<int>f1() {
  return new Future<int>(() => int.parse('100' + '500'));
}

Future<String> f2() {
  return new Future<String>(() => HELLO);
}

Future<String> f3() {
  return new Future<String>(() => (100000 + 500).toString());
}

test() async {
  Expect.identical(HELLO, await new Future.value(HELLO));
  Expect.equals(100500, await new Future.sync(() => 100000 + 500));

  Expect.equals(100500, await f1());
  Expect.identical(HELLO, await f2());
  Expect.equals('100500', await f3());
}

main() {
  asyncStart();
  test().then( (value) => asyncEnd() );
}
