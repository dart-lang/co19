/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant variable is a variable whose declaration includes the 
 * modifier const. A constant variable is always implicitly final.
 * @description Checks that a compile-time error occurs if a local constant 
 * variable is not initialized at declaration.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  const foo;
}
