// @dart = 2.9
library Script_A01_t01;
#! scripts tag    // error
//^
// [analyzer] unspecified
// [cfe] unspecified

// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A script is a library whose exported namespace includes a
/// top-level function main().
///
/// libraryDefinition:
///   scriptTag? libraryName? importOrExport* partDirective* topLevelDefinition*
/// ;
/// @description Checks that it is a compile-time error when the library name
/// comes before the script tag.
/// @author vasya
/// @reviewer msyabro


main() {
}
