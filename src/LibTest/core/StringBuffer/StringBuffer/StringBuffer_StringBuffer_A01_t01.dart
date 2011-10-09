/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates the string buffer with an initial content.
 * @description Check that StringBuffer is created with correct content
 * @author msyabro
 */


main() {
  StringBuffer sb;
  sb = new StringBuffer();
  Expect.isTrue(sb.toString() == "");
  
  sb = new StringBuffer("string");
  Expect.isTrue(sb.toString() == "string");
  
  sb = new StringBuffer("\u0000\u0001");
  Expect.isTrue(sb.toString() == "\u0000\u0001");
  
  sb = new StringBuffer("");
  Expect.isTrue(sb.toString() == "");
}
