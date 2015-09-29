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
 * logicalOrExpression is constant value.
 * @author a.semenov@unipro.ru
 */
import '../../../Utils/expect.dart';

main() {
  Expect.equals(1, 1 ?? 2);
  Expect.equals(1, 1 ?? 2 ?? 3);
  Expect.equals(1, 1 ?? 2 ?? 3 ?? 4);
  Expect.equals(2, null ?? 2);
  Expect.equals(1, null ?? 1 ?? 2);
  Expect.equals(1, null ?? 1 ?? 2 ?? 3);
  Expect.equals(1, null ?? null ?? 1 ?? 2 ?? 3);
  Expect.equals(true, null ?? true ?? 2 ?? 3);
  Expect.equals(false, null ?? false ?? 2 ?? 3);
  Expect.equals('a', 'a' ?? 'bcd');
  Expect.equals('abc', 'abc' ?? 'cde' ?? 'fgh');
  Expect.equals('abc', null ?? 'abc' ?? 'cde' ?? 'fgh');
}
