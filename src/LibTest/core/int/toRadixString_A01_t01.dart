/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toRadixString(int radix)
 * Converts a number into radix string.
 * @description Checks that this method returns correct value.
 * @author vasya
 * @author msyabro
 * @reviewer rodionov
 * @needsreview Range of accepted radices undocumented.
 */
import "../../../Utils/expect.dart";

main() {
  Expect.stringEquals("1100100", 100.toRadixString(2));
  Expect.stringEquals("10201", 100.toRadixString(3));
  Expect.stringEquals("1210", 100.toRadixString(4));
  Expect.stringEquals("121", 100.toRadixString(9));
  Expect.stringEquals("6A", 100.toRadixString(15));
  Expect.stringEquals("64", 100.toRadixString(16));
  Expect.stringEquals("-1100100", (-100).toRadixString(2));
  Expect.stringEquals("-10201", (-100).toRadixString(3));
  Expect.stringEquals("-1210", (-100).toRadixString(4));
  Expect.stringEquals("-121", (-100).toRadixString(9));
  Expect.stringEquals("-6A", (-100).toRadixString(15));
  Expect.stringEquals("-64", (-100).toRadixString(16));
  
  //This was calculated in Java, it allows radices up to 36
  Expect.stringEquals("5F", 100.toRadixString(17));
  Expect.stringEquals("48", 100.toRadixString(23));
  Expect.stringEquals("3A", 100.toRadixString(30));
  Expect.stringEquals("2U", 100.toRadixString(35));
  Expect.stringEquals("2S", 100.toRadixString(36));
  Expect.stringEquals("-2U", (-100).toRadixString(35));
  Expect.stringEquals("-2S", (-100).toRadixString(36));
  
  Expect.fail(100.toRadixString(51));
}
