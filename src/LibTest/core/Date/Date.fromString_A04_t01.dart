/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws NullPointerException if [formattedString] is null.
 * @description Checks that the correct exception is thrown
 * @author msyabro
 * @reviewer pagolubev
 */

main() {
  try {
    new Date.fromString(null);
    Expect.fail("NullPointerException is exepcted");
  } catch(NullPointerException e) {}
}
