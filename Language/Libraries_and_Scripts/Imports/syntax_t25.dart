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
 * @description Checks that it is not an error if there's more than one show
 * or hide combinator in an import directive.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

import "syntax_lib.dart" as lib show foo show someVar, foo;

main() {
  Expect.equals(1, lib.foo);
}
