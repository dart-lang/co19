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
 * @description Checks that the library name can be a qualified identifier
 * @author kaigorodov
 * @reviewer rodionov
 */

library Libraries.and.Scripts.A03.t18.lib;

main() {
  try {
    var someVar = 1;
  } catch (e) {}
}
