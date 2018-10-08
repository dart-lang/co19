/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num operator *(num other)
 * This operator implements the arithmetic multiply operation.
 * @description Checks that this operator returns correct value.
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(1, 1 * 1);
  Expect.equals(0, 1 * 0);

  Expect.equals(4294967296, 2147483648 * 2);
  Expect.equals(0, 4294967296 * 4294967296);

  Expect.equals(0, 281474976710656 * 281474976710656);
}

