/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The cast expression ensures that an object is a member of a type.
 * typeCast:
 *   asOperator type
 * ;
 * asOperator:
 *   as
 * ;
 * @description Checks that it is a compile-time error when the second argument
 * of a type cast operator is a shift expression rather than a type.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  try {
    1 as 1 << 2;
  } catch (x) {}
}
