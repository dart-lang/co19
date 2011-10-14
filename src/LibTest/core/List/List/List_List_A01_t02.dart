/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a new list of the given length.
 * @description Tries to pass negative value.
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 * @needsreview undocumented
 */

main() {
  try {
    List a = new List(-1);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}
}
