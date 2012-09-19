/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion null list elements result in an IllegalArgumentException
 * @description Tries to pass a list with null values
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */


void check(List list) {
  try {
    String str = new String.fromCharCodes(list);
    Expect.fail("IllegalArgumentException is expected");
  } on IllegalArgumentException catch(e) {}
}

main() {
  check([null]);
  check([0, 1, 2, 3, null]);
  check([null, null]);
}
