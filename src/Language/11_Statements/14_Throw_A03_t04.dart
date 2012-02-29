/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a statement of the form throw; proceeds as follows: Control is
 * transferred to the nearest innermost enclosing exception handler (11.9)
 * It is a compile-time error if a statement of the form throw; is not enclosed within a catch clause.
 * @description Checks that it is a compile-time error when a statement of the form "throw;"
 * is used outside of a catch clause.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  throw;
}
