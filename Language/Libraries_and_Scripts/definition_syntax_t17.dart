// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion libraryDefinition:
///   scriptTag? libraryName? importOrExport* partDirective* topLevelDefinition*
/// ;
/// scriptTag:
///   ‘#!’ ( ̃NEWLINE)* NEWLINE
/// ;
/// libraryName:
///   metadata library identifier (‘.’ identifier)* ‘;’
/// ;
/// importOrExport:
///   libraryImport |
///   libraryExport
/// ;
/// Libraries may be explicitly named or implicitly named. An explicitly named
/// library begins with the word library (possibly prefaced with any applicable
/// metadata annotations), followed by a qualified identifier that gives the
/// name of the library.
/// @description Checks that it is a compile-time error if the library name is
/// a function invocation expression.
/// @author vasya
/// @issue 44990

import "definition_syntax_t17_lib.dart";

main() {
  bar someVar = 1;
//^
// [analyzer] unspecified
// [cfe] unspecified
}
