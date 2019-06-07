/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks left shift via type alias for int
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import '../../../Utils/expect.dart';

typedef IntAlias = int;

main() {
  IntAlias i = 1;

  Expect.equals(2, i << 1);
  Expect.equals(4, i << 2);
  Expect.equals(8, i << 3);
  Expect.equals(16, i << 4);
  Expect.equals(32, i << 5);
  Expect.equals(64, i << 6);
  Expect.equals(-9223372036854775808, i << 63);

  Expect.equals(0, i << 64);
  Expect.equals(0, i << 65);
  Expect.equals(0, i << 100);

  int j = 0x7FFFFFFFFFFFFFFF;
  Expect.equals(-2, j << 1);
  Expect.equals(-4, j << 2);
  Expect.equals(-8, j << 3);
  Expect.equals(-16, j << 4);
  Expect.equals(-32, j << 5);
  Expect.equals(-64, j << 6);
  Expect.equals(0, j << 64);
  Expect.equals(0, j << 65);
  Expect.equals(0, j << 100);
}
