/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the string is not already all lower case, returns a new string
 *            where all characters of this string are made lower case. Returns
 *            this otherwise.
 * @description Checks that this method does not affect non-alphabetic strings
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("", "".toLowerCase());
  Expect.equals("!@#%", "!@#%".toLowerCase());
  Expect.equals("\u0000\u0001\u0002", "\u0000\u0001\u0002".toLowerCase());
  Expect.equals("1234567890", "1234567890".toLowerCase());
}
