/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [obj] to the buffer. Returns [this].
 * @description Append string to empty buffer
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  Expect.isTrue(sb.toString() == "");
  
  sb.add("");
  Expect.isTrue(sb.toString() == "");
  
  sb.add(sb.toString());
  Expect.isTrue(sb.toString() == "");
  
  sb.add("string");
  Expect.isTrue(sb.toString() == "string");
}
