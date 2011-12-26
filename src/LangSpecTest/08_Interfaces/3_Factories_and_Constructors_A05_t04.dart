/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let kI be a constructor declared in an interface I, and let kF be its 
 * corresponding constructor. Then:
 * - It is a compile-time error if kI and kF do not have the same number of required parameters.
 * @description Checks that it is a compile-time error if a named constructor kI has more
 * required parameters than kF (no optional parameters in either).
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

class F {
  factory I.foo() {
  }
}

interface I default F {
  I.foo(var v);
}

main() {
  try {
    new I.foo(null);
  } catch(var e) {}
}

