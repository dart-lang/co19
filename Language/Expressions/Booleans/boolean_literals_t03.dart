/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The reserved words true and false denote objects that represent
 * the boolean values true and false respectively. They are the boolean
 * literals.
 * booleanLiteral:
 *   true |
 *   false
 * ;
 * @description Checks that boolean literal can't be preceded by unary plus.
 * @compile-error
 * @author hlodvig
 * @reviewer iefremov
 */

main() {
  try {
    +false;
  } catch (e) {}
}
