/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
 *
 * If no radix is given then it defaults to 10. In this case, the source digits
 * may also start with 0x, in which case the number is interpreted as
 * a hexadecimal literal, which effectively means that the 0x is ignored and the
 * radix is instead set to 16.
 *
 * For any int n and radix r, it is guaranteed that
 * n == int.parse(n.toRadixString(r), radix: r).
 *
 * If the source is not a valid integer literal, optionally prefixed by a sign,
 * the onError is called with the source as argument, and its return value is
 * used instead. If no onError is provided, a FormatException is thrown.
 *
 * The onError handler can be chosen to return null. This is preferable to to
 * throwing and then immediately catching the FormatException. Example:
 *
 * var value = int.parse(text, onError: (source) => null);
 * if (value == null) ... handle the problem
 * The onError function is only invoked if source is a String. It is not invoked
 * if the source is, for example, null.
 * @description Checks that correct string can be converted to int.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(int.parse("1") == 1);
  Expect.isTrue(int.parse("01") == 1);
  Expect.isTrue(int.parse("-1") == -1);
  Expect.isTrue(int.parse("+1") == 1);
  Expect.isTrue(int.parse("0") == 0);
  Expect.isTrue(int.parse("-0") == 0);
  
  Expect.isTrue(int.parse("9223372036854775808") == 9223372036854775808); //maximum int64 + 1
  Expect.isTrue(int.parse("-9223372036854775809") == -9223372036854775809); //minimum int64 - 1
  
  Expect.isTrue(int.parse("10") == 10);
  Expect.isTrue(int.parse("0x10") == 16);
  Expect.isTrue(int.parse("0xA") == 10);
  Expect.isTrue(int.parse("0Xff") == 255);
  
  Expect.isTrue(int.parse(" 12") == 12);
  Expect.isTrue(int.parse("12 ") == 12);
  Expect.isTrue(int.parse("\n\t 12    ") == 12);
}
