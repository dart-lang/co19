/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression statement consists of an expression other than a map literal.
 * expressionStatement:
 *   expression? ';' |
 * ; 
 * Execution of an expression statement e; proceeds by evaluating e.
 * It is a compile-time error if a map literal appears in a place where a statement is expected.
 * @description Checks that it is a compile-time error when a map literal is used as a statement.
 * @compile-error
 * @author rodionov
 * @needsreview issue 3777
 */

main() {
  const {};
}
