/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int gcd(int other)
 * Returns the greatest common divisor of this integer and other.
 * ...
 * For any integer x, x.gcd(x) is x.abs().
 * @description Checks that for any integer x, x.gcd(x) is x.abs().
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(17, (-17).gcd(-17));
}
