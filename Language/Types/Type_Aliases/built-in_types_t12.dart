/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks bitwise operations via type alias for int
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import '../../../Utils/expect.dart';

typedef IntAlias = int;

main() {
  IntAlias i1 = 1;
  IntAlias i2 = 2;

  Expect.equals(0, i1 & i2);
  Expect.equals(3, i1 | i2);
  Expect.equals(3, i1 ^ i2);

  i1 = 5;
  i2 = 9;
  Expect.equals(1, i1 & i2);
  Expect.equals(13, i1 | i2);
  Expect.equals(12, i1 ^ i2);
}
