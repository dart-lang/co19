/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The String class represents character strings. Strings are immutable.
 * @description Check that functions from String class don't change object
 * @author msyabro
 */


main() {
  String s = "Immutable String ";
  String str = "Immutable String ";
  
  str.concat("string");
  Expect.isTrue(str == s);
  
  str + "string";
  Expect.isTrue(str == s);
  
  str.substring(0, 1);
  Expect.isTrue(str == s);
  
  str.toLowerCase();
  Expect.isTrue(str == s);
  
  str.toUpperCase();
  Expect.isTrue(str == s);
  
  str.trim();
  Expect.isTrue(str == s);
  
  str.replace("mm", "m");
  Expect.isTrue(str == s);
  
  str.replaceAll("mm", "m");
  Expect.isTrue(str == s);
}
