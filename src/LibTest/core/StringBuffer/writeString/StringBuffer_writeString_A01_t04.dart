/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes specified string [str] to the output stream.
 * @description Write string to empty buffer
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  Expect.isTrue(sb.toString() == "");
  
  sb.writeString("");
  Expect.isTrue(sb.toString() == "");
  
  sb.writeString(sb.toString());
  Expect.isTrue(sb.toString() == "");
  
  sb.writeString("string");
  Expect.isTrue(sb.toString() == "string");
}
