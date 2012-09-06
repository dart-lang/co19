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
 * @description Checks that all types of quotes allowed for string literals are also allowed
 * for the URI in an import directive.
 * @author rodionov
 */

import "2_Imports_A01_t18_lib1.dart";
import """2_Imports_A01_t18_lib2.dart""";
import '2_Imports_A01_t18_lib3.dart';
import '''2_Imports_A01_t18_lib4.dart''';

main() {
  try {
    someVar = 0;
  } catch(e) {}
}
