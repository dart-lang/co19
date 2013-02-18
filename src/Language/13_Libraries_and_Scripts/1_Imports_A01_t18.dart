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
 * @description Checks that all types of quotes allowed for string literals are also allowed
 * for the URI in an import directive.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

import "1_Imports_A01_t18_lib1.dart";
import """1_Imports_A01_t18_lib2.dart""";
import '1_Imports_A01_t18_lib3.dart';
import '''1_Imports_A01_t18_lib4.dart''';

main() {
  Expect.equals(1, foo1);
  Expect.equals(2, foo2);
  Expect.equals(3, foo3);
  Expect.equals(4, foo4);
}
