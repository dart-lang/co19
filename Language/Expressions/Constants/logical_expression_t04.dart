/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of one of the forms !e, e1 && e2 or e1 || e2, where e, e1 and
 * e2 are constant expressions that evaluate to a boolean value or to null is a constant expression.
 * @description Checks that it is a compile-time error when an expression of the form e1 && e2
 * where e1 or e2 does not evaluate to a boolean value, is used to initialize a constant variable. 
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

final constList = const [
  true && 1,
];

main() {
  try {
    constList is List;
  } catch(x) {}
}
