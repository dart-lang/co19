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
 * @description Checks that it is a compile-time error when the URI in an
 * import directive is enclosed in parentheses.
 * @compile-error
 * @author vasya
 * @reviewer hlodvig
 * @reviewer msyabro
 * @reviewer rodionov
 */

import("syntax_lib.dart");

main() {
  try {
    var someVar = 0;
  } catch (e) {}
}
