/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The try statement supports the definition of exception handling 
 * code in a structured way.
 * tryStatement:
 *   try block (onPart+ ﬁnallyPart? | ﬁnallyPart)
 * ;
 * onPart:
 *   catchPart block |
 *   on type catchPart? block
 * ;
 * catchPart:
 *   catch ‘(’ identiﬁer (‘, ’ identiﬁer)? ‘)’
 * ;
 * finallyPart:
 *   finally block
 * ;
 * @description Checks that it is a compile-time error if onPart has on keyword but misses type.
 * @compile-error
 * @author kaigorodov
 */

main() {
  try {
    throw "foo";
  } on catch (ex) {
  }
}
