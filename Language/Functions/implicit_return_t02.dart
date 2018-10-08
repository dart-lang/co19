/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the last statement of a function is not a return statement,
 * the statement return; is implicitly appended to the function body.
 *
 * @description Checks that the statement return; is implicitly appended
 * to the asynchronous function body.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../Utils/expect.dart';

func() async {}

f() async {
  int x = 1;
  int y = x + 1;
}

Future g() {}

test() async {
  Expect.isNull(await func());
  Expect.isNull(await f());
  Expect.isNull(await g());
}

main() {
  asyncStart();
  test().then((value) {
    Expect.isNull(value);
    asyncEnd();
  });
}
