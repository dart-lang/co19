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
 * @description Checks that it is a compile-time error when the included compilation unit contains
 * a library directive.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

#source("3_Library1.dart");

main() {
  try {
    var someVar = 0;
  } catch(var e) {}
}
