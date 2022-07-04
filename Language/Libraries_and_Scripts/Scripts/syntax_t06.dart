#! scripts tag
// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A script is a library whose exported namespace includes a
/// top-level function main().
///
/// libraryDefinition:
///   scriptTag? libraryName? importOrExport* partDirective* topLevelDefinition*
/// ;
/// @description Checks that it is a compile-time error when a part directive
/// comes before the library name.
/// @author vasya

part "syntax_t06_lib.dart";
library syntax_t06_lib;
//^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
