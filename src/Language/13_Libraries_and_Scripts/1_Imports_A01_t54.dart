/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a library to be used in the scope of another library.
 * libraryImport:
 *   metadata import uri (as identifier)? combinator* `;'
 * ;
 * combinator:
 *   show identifierList |
 *   hide identifierList
 * ;
 * identifierList:
 *   identifier (, identifier)*
 * ;
 * @description Checks that it is a compile-time error if there're no identifiers following
 * a hide combinator in an import declaration.
 * @compile-error
 * @author rodionov
 * @issue 6127
 */

import "1_Imports_lib.dart" hide;

main() {
  try {
    var x = foo;
  } catch(ok) {}
}
