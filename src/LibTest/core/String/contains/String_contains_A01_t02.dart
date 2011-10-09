/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string contains [other] starting
 * at [startIndex] (inclusive).
 * @description Try to pass null as [other]
 * @author msyabro
 * @reviewer rodionov
 */
 

main() {
  try {
    "string".contains(null, 0);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
