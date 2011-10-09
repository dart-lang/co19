/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the contents of buffer as a concatenated string.
 * @description Check that method returns correct String
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  Expect.isTrue(sb.toString() == "");
  
  sb = new StringBuffer("string");
  Expect.isTrue(sb.toString() == "string");
  
  sb.clear();
  Expect.isTrue(sb.toString() == "");
  
  sb.add("");
  Expect.isTrue(sb.toString() == "");
  
  sb.add("string");
  Expect.isTrue(sb.toString() == "string");
}
