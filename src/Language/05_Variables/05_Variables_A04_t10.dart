/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant variable is a variable whose declaration includes the modifier
 * const. A constant variable is always implicitly final.
 * @description Checks that assigning a constant variable to the same value it already holds
 * still produces a compile-time error.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

const x = 1;

main() {
  try {
    x = 1;
  } catch(ok) {}
}
