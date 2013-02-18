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
 * @description Checks that it is not an error when a library directly imports
 * the same URI more than once and doesn't reference any of the names exported
 * by that library.
 * @author rodionov
 * @reviewer kaigorodov
 * @issue 5399, 4887
 */
import "../../Utils/expect.dart";

import "1_Imports_A01_t50_lib.dart";
import "1_Imports_A01_t50_lib.dart";

main() {
//  Expect.equals(234124, foo);
}
