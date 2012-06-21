/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iff the variable declaration is prefixed with the const  modifier, 
 * the variable is marked as constant.
 * @description Checks that if the variable declaration is prefixed with the
 * const modifier, then variable must be initialized to a constant expression.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    const id = 1.toString();
  } catch(var e) {}
}
