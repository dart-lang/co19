/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds all items in [objects] to the buffer.
 * @description Checks that all items are appended to the buffer if the
 *              collection isn't empty and none are if it is.
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  StringBuffer sb = new StringBuffer();

  sb.addAll([ "string1", ", ", "string2", ", ", "string3" ]);
  Expect.equals("string1, string2, string3", sb.toString());

  sb.addAll([]);
  Expect.equals("string1, string2, string3", sb.toString());
}
