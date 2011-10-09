/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the length of the buffer.
 * @description Check that correct value is returned
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  Expect.isTrue(sb.length == 0);
  
  sb.add("");
  Expect.isTrue(sb.length == 0);
  
  sb.add("string");
  Expect.isTrue(sb.length == 6);
  
  sb.clear();
  Expect.isTrue(sb.length == 0);
}
