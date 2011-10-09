/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the string is not already all upper case, returns a new string
 * where all characters of this string are made upper case. Returns this otherwise.
 * @description Check method on non-alphabetic strings
 * @author msyabro
 */
 

main() {
  Expect.isTrue("".toUpperCase() == "");
  Expect.isTrue("!@#%".toUpperCase() == "!@#%");
  Expect.isTrue("\u0000\u0001\u0002".toUpperCase() == "\u0000\u0001\u0002");
  Expect.isTrue("1234567890".toUpperCase() == "1234567890");
}
