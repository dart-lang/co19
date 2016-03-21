/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a library to be used in the scope of another
 * library.
 * libraryImport:
 *   metadata importSpecification
 * ;
 * importSpecification:
 *   import uri (as identifier)? combinator* ‘;’ |
 *   import uri deferred as identifier combinator* ‘;’
 * ;
 * combinator:
 *   show identifierList |
 *   hide identifierList
 * ;
 * identifierList:
 *   identifier (, identifier)*
 * ;
 * @description Checks that it is a compile-time error when there is an additive
 * expression in place of the identifier (prefix).
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

import "syntax_lib.dart" as 2+2;

main() {
  try {
    someVar = 0;
  } catch (e) {}
}
