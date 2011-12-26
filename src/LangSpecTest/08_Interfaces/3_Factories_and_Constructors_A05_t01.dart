/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let kI be a constructor declared in an interface I, and let kF be its 
 * corresponding constructor. Then:
 * - It is a compile-time error if kI and kF do not have the same number of required parameters.
 * @description Checks that it is a compile-time error if the default constructor kI has fewer
 * required parameters than kF (no optional parameters in either).
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 */

class F {
  factory I(var v) {
  }
}

interface I default F {
  I();
}

main() {
  try {
    new I();
  } catch(var e) {}
}

