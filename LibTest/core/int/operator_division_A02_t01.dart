/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator /(num other)
 * The result of division is always a double.
 * @description Checks that the result of division is always a double
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(1/2 is double);
  Expect.isTrue(2/1 is double);
  Expect.isTrue(-2/1 is double);
  Expect.isTrue(1/1 is double);
  Expect.isTrue(20/10 is double);
  Expect.isTrue(1/0 is double);
  Expect.isTrue(-1/0 is double);
  Expect.isTrue(0/0 is double);
}

