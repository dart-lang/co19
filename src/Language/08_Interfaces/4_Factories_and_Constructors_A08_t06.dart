/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let kI be a constructor declared in an interface I, and let kF be its 
 * corresponding constructor. Then:
 * - It is a static type warning if the type of the nth required formal parameter
 * of kI is not identical to the type of the nth required formal parameter of kF.
 * @description Checks that the names of the required constructor parameters are
 * irrelevant as long as their types are the same.
 * @author rodionov
 * @reviewer kaigorodov
 */

class F {
  factory I(int i2, bool b2) {}
}

interface I default F {
  I(int i, bool b);
}

main() {
  new I(null, null);
}

