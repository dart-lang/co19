/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [NullPointerException] if argument is [:null:].
 * @description Checks that the correct exception is thrown.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

main() {
  try {
    new Date(2000, 1, 1, 0, 0, 0, 0).compareTo(null);
    Expect.fail("NullPointerException is expected");
  } on NullPointerException catch(e) {}
}
