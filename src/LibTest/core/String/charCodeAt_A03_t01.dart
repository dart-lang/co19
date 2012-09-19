/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws IllegalArgumentException if [index] is null
 * @description Tries to pass null as argument and expects an IllegalArgumentException
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */


main() {
  try {
    "string".charCodeAt(null);
    Expect.fail("IllegalArgumentException is expected");
  } on IllegalArgumentException catch(e) {}
}
