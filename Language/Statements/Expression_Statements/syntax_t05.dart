/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression statement consists of an expression other than a
 * non-constant map literal that has no explicit type arguments.
 * The restriction on maps is designed to resolve an ambiguity in the grammar,
 *   expressionStatement:
 *     expression? ‘;’
 *   ;
 * Execution of an expression statement e; proceeds by evaluating e.
 * It is a compile-time error if a non-constant map literal that has no explicit
 * type arguments appears in a place where a statement is expected.
 * @description Checks that a function expression can form a statement.
 * @author kaigorodov
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  () {};
}
