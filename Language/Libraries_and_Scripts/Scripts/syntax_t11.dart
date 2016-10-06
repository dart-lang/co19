#! scripts tag
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library whose exported namespace includes a
 * top-level function main().
 *
 * libraryDefinition:
 *   scriptTag? libraryName? importOrExport* partDirective* topLevelDefinition*
 * ;
 * @description Checks that a script is parsed without errors
 * if all allowed directives are present and in the correct order.
 * @author vasya
 * @reviewer rodionov
 * @reviewer msyabro
 */


library Library_with_all_directives;

export "library1.dart";

import 'library1.dart';
import 'library2.dart';

export "library2.dart";

part "library6.dart";

main() {
}
