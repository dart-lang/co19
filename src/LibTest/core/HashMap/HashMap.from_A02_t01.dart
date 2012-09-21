/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws NullPointerException if [other] is null
 * @description Checks that NullPointerException is thrown if the argument is null.
 * @author msyabro
 * @reviewer pagolubev
 */

main() {
  try {
    new HashMap.from(null);
    Expect.fail("NullPointerException is expected");
  } on NullPointerException catch(e) {}
}
