/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The conditional expression is of the form:
 * condition ? expression1 : expression2
 * Where:
 * condition is an expression in condition-expression context.
 * expression1 and expression2 are expressions.
 * @description Check that operator ? : is a valid operator
 * @author msyabro
 * @reviewer akuznecov
 */
 

main() {
  true ? true : false;
}
