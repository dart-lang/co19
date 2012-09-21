/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that [srcType] is recorded correctly.
 * @author msyabro
 * @static-warning
 * @reviewer pagolubev
 * @needsreview Undocumented.
 */

#import("../../../Utils/dynamic_check.dart");

class MyClass {
  MyClass() {}
}

main() {
  if(isCheckedMode()) {
    try {
      int x = "string";
      Expect.fail("TypeError is expected");
    } on TypeError catch(e) {
      Expect.isTrue(e.srcType is String);
    }

    try {
      bool val = 1;
      Expect.fail("TypeError is expected");
    } on TypeError catch(e) {
      Expect.isTrue(e.srcType is String);
    }

    try {
      String str = new MyClass();
      Expect.fail("TypeError is expected");
    } on TypeError catch(e) {
      Expect.isTrue(e.srcType is String);
    }

    try {
      MyClass str = [];
      Expect.fail("TypeError is expected");
    } on TypeError catch(e) {
      Expect.isTrue(e.srcType is String);
    }
  }
}
