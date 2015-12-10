/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Function invocation involves evaluation of the list of actual
 * arguments to the function and binding of the results to the functions
 * formal parameters.
 * arguments:
 *   '(' argumentList? ')'
 * ;
 * argumentList:
 *   namedArgument (', ' namedArgument)* |
 *   expressionList (', ' namedArgument)*
 * ;
 * namedArgument:
 *   label expression
 * ;
 * @description Checks that arguments in a function invocation expression
 * must be comma-delimited.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

func(p1, p2) {}

main() {
  try {
    func(1 2);
  } catch (e) {}
}
