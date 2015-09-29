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
 * logicalOrExpression is an expression.
 * @author a.semenov@unipro.ru
 */
import '../../../Utils/expect.dart';

main() {
  int x = 1;

  Expect.equals(2, (x + 1) ?? 10);
  Expect.iterableEquals([], [] ?? 10);
  Expect.equals(30, (10 + 5 * 4) ?? (2 + 2 * 2));
}
