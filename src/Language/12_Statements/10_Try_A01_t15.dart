/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The try statement supports the definition of exception handling 
 * code in a structured way.
 * tryStatement:
 *   try block (onPart+ finallyPart? | finallyPart)
 * ;
 * onPart:
 *   catchPart block |
 *   on type catchPart? block
 * ;
 * catchPart:
 *   catch ‘(’ identifier (‘, ’ identifier)? ‘)’
 * ;
 * finallyPart:
 *   finally block
 * ;
 * @description Checks that it is a compile-time error if a catch clause specifies
 * two exception parameters with the same name.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  try {
    throw "foo";
  } catch (e, e) {
  }
}
