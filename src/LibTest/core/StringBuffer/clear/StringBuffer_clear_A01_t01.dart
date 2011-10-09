/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Clears the string buffer.
 * @description Check that method clears the buffer
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  sb.clear();
  
  Expect.isTrue(sb.toString() == "");
  
  sb.add("aaa");
  Expect.isTrue(sb.toString() == "aaa");
  
  sb.clear();
  Expect.isTrue(sb.toString() == "");
}
