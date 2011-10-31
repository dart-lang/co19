/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that [dstType] is recorded correctly.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Mark this test for checked mode only. Undocumented.
 */

class MyClass {
  MyClass() {}
}

main() {
  try {
    int x = true;
    Expect.fail("TypeError is expected");
  } catch(TypeError e) {
    Expect.equals('int', e.dstType);
  }

  try {
    bool val = 1;
    Expect.fail("TypeError is expected");
  } catch(TypeError e) {
    Expect.equals('bool', e.dstType);
  }

  try {
    String str = true;
    Expect.fail("TypeError is expected");
  } catch(TypeError e) {
    Expect.equals('String', e.dstType);
  }

  try {
    MyClass str = true;
    Expect.fail("TypeError is expected");
  } catch(TypeError e) {
    Expect.equals('MyClass', e.dstType);
  }
}
