/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Factory implementation of String.fromCharCodes:
 * Allocates a new String for the specified [charCodes].
 * @description Check that correct string is created
 * @author msyabro
 */


main() {
  String str = new String.fromCharCodes(['a', 'b', 'c', 'd']);
  Expect.isTrue(str == "abcd");
  
  str = new String.fromCharCodes([]);
  Expect.isTrue(str == "");
  
  str = new String.fromCharCodes([0x61, 0x62, 0x63, 0]);
  Expect.isTrue(str == "abc\u0000");
  
  str = new String.fromCharCodes([0]);
  Expect.isTrue(str == "\u0000");
}
