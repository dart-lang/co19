/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the contents of buffer as a concatenated string.
 * @description Checks that this method returns a correct String
 * @author msyabro
 * @reviewer rodionov
 */


main() {
  StringBuffer sb = new StringBuffer();
  Expect.equals("", sb.toString());
  
  sb = new StringBuffer("string");
  Expect.equals("string", sb.toString());
  
  sb.clear();
  Expect.equals("", sb.toString());
  
  sb.add("");
  Expect.equals("", sb.toString());
  
  sb.add("string");
  Expect.equals("string", sb.toString());
}
