/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The throw expression is used to raise an exception.
 * throwExpression:
 *   throw expression
 * ;
 * throwExpressionWithoutCascade:
 *   throw expressionWithoutCascade
 * ;
 * @description Checks the throw expression can be used on the right-hand side
 * of a conditional expression.
 * @author kaigorodov
 * @reviewer rodionov
 */

main() {
  var p;
  try {
    var x = p == null ? throw "fail" : p;
  } catch (e) { }
}
