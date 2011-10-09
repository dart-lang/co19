/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string ends with [other].
 * @description Try to pass null as [other]
 * @author msyabro
 * @needsreview undocumented
 */


main() {
  try {
    "".endsWith(null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
