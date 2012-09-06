/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a library to be used in the scope of another library.
 * libraryImport:
 *   metadata import uri (as identifier)? combinator* (`&` export)? `;'
 * ;
 * combinator:
 *   show identifierList |
 *   hide identifierList
 * ;
 * identifierList:
 *   identifier (, identifier)*
 * ;
 * @description Checks that it is not a compile-time error if the arguments of show/hide
 * combinators include identifiers not declared or reexported by the library being imported.
 * @author rodionov
 */

import "2_Imports_lib.dart" as lib hide foo1 show foo2;

main() {
  Expect.equals(1, lib.foo);
}
