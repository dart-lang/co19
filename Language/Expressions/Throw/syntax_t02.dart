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
 * @description The grammar does not allow throw with no expression. Checks
 * that this is a compile-error.
 * @compile-error
 * @author ilya
 */

main() {
  try {
  } catch (e) {
    throw;
  }
}
