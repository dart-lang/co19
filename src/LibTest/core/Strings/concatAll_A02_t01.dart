/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws NullPointerException if argument is null.
 * @description Checks that passing a null argument results in NullPointerException
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */


main() {
  try {
    Strings.concatAll(null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
