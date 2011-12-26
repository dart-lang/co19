/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable that is both static and final must be initialized to 
 * a compile-time constant (10.1) or a compile-time error occurs. 
 * @description Checks that a compile-time error occurs if a static final variable is
 * initialized to a non compile-time constant. Checks that expression e1 + e2, where
 * e1 and e2 is string literals can't initialize a constant static variable.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 * @needsreview issue 961
 * move this test to Expressions/Constants?
 */

class C {
  static final String s = "One" + "Two";
}

main() {
  try {
    C.s;
  } catch(var e) {}
}

