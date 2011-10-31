/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that [srcType] is recorded correctly.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Mark this test for checked mode only. Undocumented.
 */

class MyClass {
  MyClass() {}
}

main() {
  try {
    int x = "string";
    Expect.fail("TypeError is expected");
  } catch(TypeError e) {
    Expect.equals('OneByteString', e.srcType);
  }

  try {
    bool val = 1;
    Expect.fail("TypeError is expected");
  } catch(TypeError e) {
    Expect.equals('Smi', e.srcType);
  }

  try {
    String str = new MyClass();
    Expect.fail("TypeError is expected");
  } catch(TypeError e) {
    Expect.equals('MyClass', e.srcType);
  }

  try {
    MyClass str = [];
    Expect.fail("TypeError is expected");
  } catch(TypeError e) {
    Expect.equals('GrowableObjectArray<var>', e.srcType);
  }
}
