/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let kI be a constructor declared in an interface I, and let kF be its 
 * corresponding constructor. Then:
 * - It is a static type warning if the types of named optional parameters with
 * the same name differ between kI and kF.
 * @description Checks that it is a static type warning if the types of 
 * named optional parameters with the same name differ between kI and kF.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */

class F {
  factory I(bool value, [double a, String s, int i]) {}
}

interface I default F {
  I(bool value, [num a, String s, int i]);
}

main() {
  new I(null);
}

