/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *  ifNullExpression:
 *   logicalOrExpression (‘??’ logicalOrExpression)*
 *
 * @description Verify several kinds of if-null expressions,
 * logicalOrExpression is variable.
 * @author a.semenov@unipro.ru
 */
import '../../../Utils/expect.dart';

main() {
  int x = 1;
  var n = null;

  Expect.equals(1, x ?? 10);
  Expect.equals(1, x ?? 10 ?? 20);
  Expect.equals(1, x ?? 10 ?? 20 ?? 30);
  Expect.equals(10, n ?? 10);
  Expect.equals(10, n ?? 10 ?? 20);
  Expect.equals(10, n ?? 10 ?? 20 ?? 40);
  Expect.equals(x, x ?? n);
  Expect.equals(x, n ?? x);
  Expect.equals(x, n ?? n ?? x);
  Expect.equals(x, x ?? n ?? 5);
  Expect.equals(x, n ?? x ?? 5);
}
