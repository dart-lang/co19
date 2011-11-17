/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Passing null in place of a pattern results in NullPointerException
 * @description Tries to pass null as [other] and expects a NullPointerException
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */
 

main() {
  try {
    "string".contains(null, 0);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
