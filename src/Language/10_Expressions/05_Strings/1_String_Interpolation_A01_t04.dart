/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is possible to embed expressions within string literals, such that the these
 * expressions are evaluated, and the resulting values are converted into strings and concatenated
 * with the enclosing string. This process is known as string interpolation.
 * STRING_INTERPOLATION:
 *   '$' IDENTIFIER_NO_DOLLAR
 *   | '$' '{' Expression '}'
 * ;
 * @description Checks that it is a compile-time error if the identifier in a string
 * interpolation construct is the name of a class rather than a variable.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class A {}

main() {
  try {
    '$A';
  } catch(var e) {}
}
