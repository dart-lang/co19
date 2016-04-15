/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A single line comment begins with the token //.
 * Everything between // and the end of line must be ignored by the Dart
 * compiler unless the comment is a documentation comment.
 * SINGLE LINE COMMENT:
 *   '//' ~(NEWLINE)* (NEWLINE)?
 * ;
 * @description Checks that everything between // and the end of line is ignored
 * by the Dart compiler.
 * @author vasya
 * @reviewer rodionov
 */
import "../../../../Utils/expect.dart";

foo (int x, int y) { // this function returns modulo of x and y.
  return x % y;
} // end of function

main() {
  try { // start try statement
    foo(1, 0); // call foo() with 1 and 0 params
    Expect.fail("");
  } on Exception catch (e) { // try to catch exception
    // Expect.fail(e.toString());
  } // end try statement
}
