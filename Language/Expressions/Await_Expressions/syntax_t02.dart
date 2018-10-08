/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *  awaitExpression:
 *      await unaryExpression
 *
 * @description Verify several kinds of valid await expressions inside
 * functions with async* modifier
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';


f() {
  return new Future<int>.value(1);
}

Stream test() async* {
  int x = 100500;

  await true;
  await 1;
  await x;
  await (x + 3);
  await x++;
  await --x;
  await ((x + 10) * 10);
  await 'hello';
  await f();
  await (await f());
  await ! await false;
  await ~ await (x * x);
  await - await f();
  await (10 - await 5);
  await await 'bye bye';
}

class S {
  var x = 1;
  operator -() { return this; }
  operator ~() { return this; }
}

class A extends S {
  Stream test() async* {
    await - super;
    await ~ super;
  }
}

main() {
  asyncStart();
  test().isEmpty.then(
    (value) => new A().test().isEmpty
  ).then(
    (value) => asyncEnd()
  );
}
