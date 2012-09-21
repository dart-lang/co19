/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns maximum from [a] and [b]
* @description Checks that NullPointerException is thrown when passed argument is a null.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

#import("dart:math", prefix: "Math");

void checkNPE(var arg1, var arg2) {
  try {
    Math.max(arg1, arg2);
    Expect.fail("NullPointerException is expected");
  } on NullPointerException catch(e) {}
}
main() {
  checkNPE(null, 0);
  checkNPE(0, null);
  checkNPE(null, null);
  
  checkNPE(double.INFINITY, null);
  checkNPE(double.NEGATIVE_INFINITY, null);
  checkNPE(double.INFINITY, null);
}
