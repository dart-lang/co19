/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int parse(String source, {int radix, int onError(String source)})
 * Parse source as a, possibly signed, integer literal and return its value.
 *
 * The source must be a non-empty sequence of base-radix digits, optionally
 * prefixed with a minus or plus sign ('-' or '+').
 *
 * The radix must be in the range 2..36. The digits used are first the decimal
 * digits 0..9, and then the letters 'a'..'z' with values 10 through 35. Also
 * accepts upper-case letters with the same values as the lower-case ones.
 * ...
 * @description Checks that radix argument must be in the range 2..36
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {int.parse("1", radix: 1);});
  Expect.throws(() {int.parse("1", radix: 0);});
  Expect.throws(() {int.parse("1", radix: -1);});
  Expect.throws(() {int.parse("1", radix: -20);});
  Expect.throws(() {int.parse("1", radix: 37);});
  Expect.throws(() {int.parse("1", radix: -37);});
  Expect.throws(() {int.parse("1", radix: 1234567891234567890);});

  for (int i = 2; i <= 36; i++) {
    int.parse("1", radix: i);
  }
}
