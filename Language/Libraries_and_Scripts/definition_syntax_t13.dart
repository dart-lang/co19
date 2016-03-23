/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion libraryDefinition:
 *   scriptTag? libraryName? importOrExport* partDirective* topLevelDefinition*
 * ;
 * scriptTag:
 *   ‘#!’ ( ̃NEWLINE)* NEWLINE
 * ;
 * libraryName:
 *   metadata library identifier (‘.’ identifier)* ‘;’
 * ;
 * importOrExport:
 *   libraryImport |
 *   libraryExport
 * ;
 * Libraries may be explicitly named or implicitly named. An explicitly named
 * library begins with the word library (possibly prefaced with any applicable
 * metadata annotations), followed by a qualified identifier that gives the
 * name of the library.
 * @description Checks that valid library directives (according to the spec)
 * do not cause compile-time errors.
 * @author msyabro
 * @reviewer rodionov
 */

import "definition_syntax_t13_p1.dart" as lib1;
import "definition_syntax_t13_p2.dart" as lib2;
import "definition_syntax_t13_p3.dart" as lib3;
import "definition_syntax_t13_p4.dart" as lib4;
import "definition_syntax_t13_p5.dart" as lib5;
import "definition_syntax_t13_p6.dart" as lib6;

main() {
  lib1.foo;
  lib2.foo;
  lib3.foo;
  lib4.foo;
  lib5.foo;
  lib6.foo;
}
