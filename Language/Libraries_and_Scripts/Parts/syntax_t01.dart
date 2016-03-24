/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library may be divided into parts, each of which can be stored
 * in a separate location. A library identifies its parts by listing them via
 * part directives.
 * A part directive specifies a URI where a Dart compilation unit that should
 * be incorporated into the current library may be found.
 * partDirective:
 *   metadata part uri ';'
 * ;
 * partHeader:
 *   metadata part of identifier (‘.’ identifier)* ‘;’
 * ;
 * partDeclaration:
 *   partHeader topLevelDefinition* EOF
 * ;
 * A part header begins with part of followed by the name of the library the
 * part belongs to. A part declaration consists of a part header followed by a
 * sequence of top-level declarations.
 * @description Checks that part unit can not contain an import directive.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

library Parts_test_lib.id;
part "part_10.dart";

main() {
}
