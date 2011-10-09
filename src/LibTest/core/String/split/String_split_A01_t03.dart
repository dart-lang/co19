/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Splits the string around matches of [pattern]. Returns
 * an array of substrings.
 * @description Try to pass null as pattern
 * @author msyabro
 * @needsreview undocumented
 */


main() {
  try {
    "1111".split(null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
