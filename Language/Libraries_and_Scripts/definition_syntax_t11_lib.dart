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
///
/// @description Checks that a library is parsed without errors if all allowed
/// directives are present in permitted numbers and in the correct order.
/// @author msyabro

library Library_with_all_directives;

import 'Scripts/library1.dart';
import 'Scripts/library2.dart';

part 'definition_syntax_t11_lib_p1.dart';
part 'definition_syntax_t11_lib_p2.dart';
part 'definition_syntax_t11_lib_p3.dart';

class Foo {}

final int boo = 1;

void bar() {}
