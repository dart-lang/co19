/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int toSigned(int width)
 * Returns the least significant width bits of this integer, extending the
 * highest retained bit to the sign. This is the same as truncating the value
 * to fit in width bits using an signed 2-s complement representation.
 * The returned value has the same bit value in all positions higher than width.
 *                                V--sign bit-V
 *  16.toSigned(5) == -16   //  00010000 -> 11110000
 *  239.toSigned(5) == 15   //  11101111 -> 00001111
 * ...
 * @description Checks that this method returns the least significant width bits
 * of this integer, extending the highest retained bit to the sign
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(-16, 16.toSigned(5)); // 00010000 -> 11110000
  Expect.equals(15, 239.toSigned(5)); // 11101111 -> 00001111
}
