/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the class C has an implementation
 * of the operator == other than the one inherited from Object unless the
 * value of the expression is a string, an integer, literal symbol or the result
 * of invoking a constant constructor of class Symbol.
 * @description Checks that it is a compile-time error if a case expression
 * is a compile-time constant of type double, since double is neither String
 * nor int and implements ==.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 * @note renamed from 09_Switch_A02_t04
 */

main() {
  try {
    switch (1.0) {
      case 0.5:
    }
  } catch (e) {}
}
