/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns [this].
 * @description Checks that method returns this instance
 * @author msyabro
 * @reviewer rodionov
 */


main() {
  StringBuffer sb = new StringBuffer();
  Expect.isTrue(sb === sb.add("string"));
  Expect.isTrue(sb === sb.add(""));
  Expect.isTrue(sb === sb.add(null));
}
