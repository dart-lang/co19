/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a new string by concatenating this string with [other].
 * @description Checks that concatenation works correctly
 * @author msyabro
 */
 

main() {
  String str = "str";
  String str2 = "ing";
  
  Expect.isTrue(str.concat(str2) == "string");
  Expect.isTrue(str.concat("") == str);
  Expect.isTrue("".concat(str) == str);
  Expect.isTrue("".concat("") == "");

  Expect.isTrue("a".concat("b").concat("c") == "abc");
  
  String s = "s";
  Expect.isTrue(s.concat(s.concat(s)) == "sss");
}
