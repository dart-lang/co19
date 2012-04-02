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
 * @description Checks that it is a compile-time error when the identifier in string
 * interpolation construct of the form '$' IDENTIFIER_NO_DOLLAR starts with the dollar character.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

main() {
  var $x = "dollar";
  var x = "dollar";
  try {
    '$$x';
  } catch(var e) {}
}
