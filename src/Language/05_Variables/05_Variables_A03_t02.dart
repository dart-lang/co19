/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A final variable is a variable whose declaration includes the modifier final. 
 * A final variable can only be assigned once, when it is initialized, or a compile-time error occurs.
 * It is a compile-time error if a variable v is a final top-level variable or a
 * final local variable and v is not initialized at its point of declaration.
 * @description Checks that a compile-time error occurs if local final variable is not assigned.
 * @author vasya
 * @reviewer kaigorodov
 * @compile-error
 */

main() {
  try {
    final foo;
    Expect.equals(null, foo);
  } catch(ok) {}
}
