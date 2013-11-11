/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form e1?e2:e3 where where e1, e2 and e3
 * are constant expressions and e1 evaluates to a boolean value is a constant expression.
 * @description Checks that if e1 does not evaluate to boolean then conditional
 * expression is not a constant expression.
 * @compile-error
 * @author ilya
 */

const x = true;
const y = null ? true : 1;
  
main() {
  y;
}
