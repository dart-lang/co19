// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A script is a library whose exported namespace includes a
/// top-level function main().
///
/// libraryDefinition:
///   scriptTag? libraryName? importOrImport* partDirective* topLevelDefinition*
/// ;
/// topLevelDefinition:
///   classDefinition |
///   enumType |
///   typeAlias |
///   external? functionSignature ‘;’ |
///   external? getterSignature ‘;’ |
///   external? setterSignature ‘;’ |
///   functionSignature functionBody |
///   returnType? get identifier functionBody |
///   returnType? set identifier formalParameterList functionBody |
///   (final | const) type? staticFinalDeclarationList ‘;’ |
///   variableDeclaration ‘;’
/// ;
/// @description Checks that it is a compile-time error when a backslash
/// character is used in place of a top level definition in a script.
/// @author msyabro


final x = 1;
\
//^
// [analyzer] unspecified
// [cfe] unspecified
var y = 2;

main() {
  y = 3;
}
