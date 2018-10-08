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
 * is suspended until after f completes. Test mixed static and instance sync
 * and async methods
 * @author sgrekhov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

class C {
  Future f1() async => new Future.delayed(new Duration(milliseconds: 50));
  static Future f2() async => new Future.delayed(new Duration(milliseconds: 100));
  static Future f3() {
    return new Future.delayed(new Duration(milliseconds: 10));
  }
  Future f4() => new Future.delayed(new Duration(milliseconds: 30));
}

test() async {
  List<String> log = [];
  C c = new C();
  await c.f1().then((val) { log.add("f1"); });
  await C.f2().then((val) { log.add("f2"); });
  await C.f3().then((val) { log.add("f3"); });
  await c.f4().then((val) { log.add("f4"); });
  Expect.listEquals(["f1", "f2", "f3", "f4"], log);
}

main() {
  asyncStart();
  test().then((value) => asyncEnd());
}
