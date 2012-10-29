#! scripts tag
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library with a top level function main().
 * scriptDefinition:
 *   scriptTag? libraryName? libraryImport* partDirective* topLevelDefinition*
 * ;
 * @description Checks that a script is parsed without errors
 * if all allowed directives are present and in the correct order.
 * @static-warning parts reference a different library name
 * @author vasya
 * @reviewer rodionov
 * @reviewer msyabro
 */


library Library_with_all_directives;

import '4_Library1.dart';
import '4_Library2.dart';

part "3_Part_0.dart";
part "3_Part_3.dart";

main() {
}
