/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is not a static warning if the type of e is not a subtype of
 * Future. Tools may choose to give a hint in such cases.
 *
 * @description Check that no static warning is issued if type of e is not
 * subtype of Future.
 *
 * @static-clean
 * @author a.semenov@unipro.ru
 */
import '../../../Utils/expect.dart';
f() {
  return new Exception();
}

test() async {
  int x = 100500;

  await null;
  await true;
  await 1;
  await x;
  await (x + 3);
  await 'hello';
  await new Object();
  await f();
}

main() {
  asyncStart();
  test().then((value) => asyncEnd());
}
