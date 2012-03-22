/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An include directive specifies a URI where a Dart compilation unit that should
 * be incorporated into the current library may be found.
 * include:
 * '#' 'source' '(' stringLiteral ')' ';'
 * ;
 * compilationUnit:
 *   topLevelDefinition* EOF
 * ;
 * A compilation unit is a sequence of top level declarations.
 * @description Checks that it is a compile-time error when an include directive
 * is missing both parentheses and the URI.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

#source;

main() {
  try {
    var someVar = 1;
  } catch(var e) {}
}
