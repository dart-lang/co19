/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Allocates a new String for the specified [charCodes].
 * @description Checks that a correct string is created
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str = new String.fromCharCodes([0x61, 0x62, 0x63, 0x64]);
  Expect.isTrue(str == "abcd");
  
  str = new String.fromCharCodes([]);
  Expect.isTrue(str == "");
  
  str = new String.fromCharCodes([0x61, 0x62, 0x63, 0]);
  Expect.isTrue(str == "abc\u0000");
  
  str = new String.fromCharCodes([0]);
  Expect.isTrue(str == "\u0000");

  str = new String.fromCharCodes([0x61, 0, 0x62]);
  Expect.isTrue(str == 'a\u0000b');
}
