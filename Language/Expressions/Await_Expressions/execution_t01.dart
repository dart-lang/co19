/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an await expression a of the form await e proceeds
 * as follows:
 * ...
 * If e raises an exception x, then an instance f of class Future is allocated
 * and later completed with x. Otherwise, if e evaluates to an object o that is
 * not an instance of Future, then let f be the result of calling
 * Future.value() with o as its argument; otherwise let f be the result of
 * evaluating e.
 * Next, execution of the function m immediately enclosing a is suspended
 * until after f completes.
 * @description Check that execution of the function m immediately enclosing a
 * is suspended until after f completes
 * @author sgrekhov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

Future f1() async {
  return new Future.delayed(new Duration(milliseconds: 50));
}

Future f2() async {
  return new Future.delayed(new Duration(milliseconds: 100));
}

Future f3() async {
  return new Future.delayed(new Duration(milliseconds: 10));
}

test() async {
  List<String> log = [];
  await f1().then((val) { log.add("f1"); });
  await f2().then((val) { log.add("f2"); });
  await f3().then((val) { log.add("f3"); });
  Expect.listEquals(["f1", "f2", "f3"], log);
}

main() {
  asyncStart();
  test().then((value) => asyncEnd());
}
