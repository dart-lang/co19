/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion N/A
 * @description Checks that right shift works with integers as expected
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

main() {
  int i = 1;
  Expect.equals(0, i >> 1);
  Expect.equals(0, i >> 2);
  Expect.equals(0, i >> 64);
  Expect.equals(0, i >> 100);

  int j = 0x7FFFFFFFFFFFFFFF;
  Expect.equals(4611686018427387903, j >> 1);
  Expect.equals(2305843009213693951, j >> 2);
  Expect.equals(1152921504606846975, j >> 3);
  Expect.equals(3, j >> 61);
  Expect.equals(1, j >> 62);
  Expect.equals(0, j >> 63);
  Expect.equals(0, j >> 64);
  Expect.equals(0, j >> 65);
  Expect.equals(0, j >> 100);
}
