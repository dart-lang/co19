/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the natural logarithm (base e) of a double value.
 * @description Checks that NullPointerException is thrown when passed argument is a null.
 * @author msyabro
 * @needsreview undocumented
 * @reviewer pagolubev
 */

#import("dart:math", prefix: "Math");

main() {
  try {
    Math.log(null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
