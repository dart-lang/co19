/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the string is not already all upper case, returns a new string
 * where all characters of this string are made upper case. Returns this otherwise.
 * @description Check basic cases
 * @author msyabro
 * @reviewer rodionov
 */
 

main() {
  String str = "lowercase";
  String str2 = "Almostlowercase";
  
  Expect.isTrue(str.toUpperCase() == "LOWERCASE");
  Expect.isTrue(str2.toUpperCase() == "ALMOSTLOWERCASE");
}
