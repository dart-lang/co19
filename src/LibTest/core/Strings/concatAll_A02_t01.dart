/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws Error if argument is null.
 * @description Checks that passing a null argument results in Error
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */


main() {
  try {
    Strings.concatAll(null);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}
