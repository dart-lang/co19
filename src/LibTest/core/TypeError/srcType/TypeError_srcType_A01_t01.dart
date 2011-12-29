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

#import("../../../../Utils/dynamic_check.dart");

class MyClass {
  MyClass() {}
}

main() {
  try {
    int x = "string";
    if(isCheckedMode()) {Expect.fail("TypeError is expected");}
  } catch(TypeError e) {
    Expect.equals('OneByteString', e.srcType);
  }

  try {
    bool val = 1;
    if(isCheckedMode()) {Expect.fail("TypeError is expected");}
  } catch(TypeError e) {
    Expect.equals('Smi', e.srcType);
  }

  try {
    String str = new MyClass();
    if(isCheckedMode()) {Expect.fail("TypeError is expected");}
  } catch(TypeError e) {
    Expect.equals('MyClass', e.srcType);
  }

  try {
    MyClass str = [];
    if(isCheckedMode()) {Expect.fail("TypeError is expected");}
  } catch(TypeError e) {
    Expect.equals('GrowableObjectArray<Dynamic>', e.srcType);
  }
}
