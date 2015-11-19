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
 * @description Checks that "false" is a reserved word.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    var false;
  } catch (e) {}
}
