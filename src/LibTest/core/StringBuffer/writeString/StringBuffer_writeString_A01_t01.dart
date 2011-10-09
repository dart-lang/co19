/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes specified string [str] to the output stream.
 * @description Check that String is appended to the buffer
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer("buffer");
  Expect.isTrue(sb.toString() == "buffer");
  
  sb.writeString("");
  Expect.isTrue(sb.toString() == "buffer");
  
  sb.writeString(sb.toString());
  Expect.isTrue(sb.toString() == "bufferbuffer");
  
  sb.writeString("\u0000");
  Expect.isTrue(sb.toString() == "bufferbuffer\u0000");
}
