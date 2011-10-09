/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds all items in [objects] to the buffer. Returns [this].
 * @description Check that method returns this
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  StringBuffer  newSB = sb.addAll([1, 2, 3]);
  Expect.isTrue(sb === newSB);
}
