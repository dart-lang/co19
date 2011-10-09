/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Closes the input stream and releases all system resources.
 * @description Check that string can be read from closed buffer
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer("string");
  sb.close();
  Expect.isTrue(sb.toString() == "string");
}
