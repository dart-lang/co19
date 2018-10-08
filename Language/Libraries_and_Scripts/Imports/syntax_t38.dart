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
 * @description Checks that it is not an error if the arguments of show/hide
 * combinators include identifiers named 'hide' and 'show' and that filtering
 * of the imported names is done correctly.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

import "syntax_lib.dart" show hide, show;

main() {
  Expect.equals(hide, "hide");
  Expect.equals(show, "show");
}
