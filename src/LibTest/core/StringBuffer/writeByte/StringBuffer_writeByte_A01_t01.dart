/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes specified byte [value] to the output stream.
 * @description Check that [value] is added to the buffer
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  
  sb.writeByte(0x61);
  Expect.isTrue(sb.toString() == "a");
  
  sb.writeByte(97);
  Expect.isTrue(sb.toString() == "aa");
  
  sb.writeByte(0);
  Expect.isTrue(sb.toString() == "aa\u0000");
}
