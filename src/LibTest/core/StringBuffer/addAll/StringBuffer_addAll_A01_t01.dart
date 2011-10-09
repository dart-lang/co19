/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds all items in [objects] to the buffer. Returns [this].
 * @description Check that all items are appended to the buffer
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  
  sb.addAll(["string1", ", ", "string2", ", ", "string3"]);
  Expect.isTrue(sb.toString() == "string1, string2, string3");
  
  sb.addAll([]);
  Expect.isTrue(sb.toString() == "string1, string2, string3");
}
