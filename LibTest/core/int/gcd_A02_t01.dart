/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int gcd(int other)
 * Returns the greatest common divisor of this integer and other.
 * ...
 * If both this and other is zero, the result is also zero.
 * @description Checks the case when one of the arguments is zero
 * @author sgrekhov@unipro.ru
 * @issue 27997
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 0.gcd(0));
  Expect.equals(1, 1.gcd(0));
  Expect.equals(1, 0.gcd(1));
}
