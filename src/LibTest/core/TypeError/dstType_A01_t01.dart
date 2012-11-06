/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that [dstType] is recorded correctly.
 * @static-warning
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Undocumented.
 */

import "../../../Utils/dynamic_check.dart";

class MyClass {
  MyClass() {}
}

main() {
  if(isCheckedMode()) {
    try {
      int x = true;
      Expect.fail("TypeError is expected");
    } on TypeError catch(e) {
      Expect.equals('int', e.dstType);
    }

    try {
      bool val = 1;
      Expect.fail("TypeError is expected");
    } on TypeError catch(e) {
      Expect.equals('bool', e.dstType);
    }

    try {
      String str = true;
      Expect.fail("TypeError is expected");
    } on TypeError catch(e) {
      Expect.equals('String', e.dstType);
    }

    try {
      MyClass str = true;
      Expect.fail("TypeError is expected");
    } on TypeError catch(e) {
      Expect.equals('MyClass', e.dstType);
    }
  }
}
