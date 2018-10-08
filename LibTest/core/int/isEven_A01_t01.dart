/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isEven
 * Returns true if and only if this integer is even.
 * @description Checks that this method returns true if and only if this integer
 * is even.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(0.isEven);
  Expect.isTrue(2.isEven);
  Expect.isTrue(4.isEven);
  Expect.isTrue(6.isEven);
  Expect.isTrue(8.isEven);
  Expect.isTrue(8000000000000000000.isEven);

  Expect.isTrue((-2).isEven);
  Expect.isTrue((-4).isEven);
  Expect.isTrue((-6).isEven);
  Expect.isTrue((-8).isEven);
  Expect.isTrue((-80000000000000000).isEven);

  Expect.isFalse(1.isEven);
  Expect.isFalse(3.isEven);
  Expect.isFalse(5.isEven);
  Expect.isFalse(9.isEven);
  Expect.isFalse(8000000000000000001.isEven);

  Expect.isFalse((-1).isEven);
  Expect.isFalse((-3).isEven);
  Expect.isFalse((-5).isEven);
  Expect.isFalse((-9).isEven);
  Expect.isFalse((-800000000000000001).isEven);
}
