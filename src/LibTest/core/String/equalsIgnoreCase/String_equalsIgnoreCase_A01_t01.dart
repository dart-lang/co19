/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the two strings are equal, ignoring the case.
 * @description Checks that comparison works correctly
 * @author msyabro
 */


main() {
  String str = "string";
  String str2 = "STRING";
  
  Expect.isTrue(str.equalsIgnoreCase(str2) == true);
  Expect.isTrue(str.equalsIgnoreCase("string") == true);
  Expect.isTrue(str.equalsIgnoreCase("strin") == false);
  
  Expect.isTrue("\u0049".equalsIgnoreCase("i"));
  Expect.isTrue("\u0069".equalsIgnoreCase("i"));
  Expect.isTrue("\u0130".equalsIgnoreCase("i"));
  Expect.isTrue("\u0131".equalsIgnoreCase("i"));
}
