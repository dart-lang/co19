/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toRadixString(int radix)
 * Converts this to a string representation in the given radix.
 *
 * In the string representation, lower-case letters are used for digits
 * above '9', with 'a' being 10 an 'z' being 35.
 * @description Checks that this method returns correct value.
 * @author vasya
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.stringEquals("1100100", 100.toRadixString(2));
  Expect.stringEquals("10201", 100.toRadixString(3));
  Expect.stringEquals("1210", 100.toRadixString(4));
  Expect.stringEquals("121", 100.toRadixString(9));
  Expect.stringEquals("6a", 100.toRadixString(15));
  Expect.stringEquals("64", 100.toRadixString(16));
  Expect.stringEquals("-1100100", (-100).toRadixString(2));
  Expect.stringEquals("-10201", (-100).toRadixString(3));
  Expect.stringEquals("-1210", (-100).toRadixString(4));
  Expect.stringEquals("-121", (-100).toRadixString(9));
  Expect.stringEquals("-6a", (-100).toRadixString(15));
  Expect.stringEquals("-64", (-100).toRadixString(16));

  Expect.stringEquals("5f", 100.toRadixString(17));
  Expect.stringEquals("48", 100.toRadixString(23));
  Expect.stringEquals("3a", 100.toRadixString(30));
  Expect.stringEquals("2u", 100.toRadixString(35));
  Expect.stringEquals("2s", 100.toRadixString(36));
  Expect.stringEquals("-2u", (-100).toRadixString(35));
  Expect.stringEquals("-2s", (-100).toRadixString(36));
  
  Expect.throws(() {100.toRadixString(51);});
}
