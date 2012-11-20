/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * partHeader:
 *   metadata part of identifier `;'
 * ;
 * partDeclaration:
 *   partHeader topLevelDefinition* EOF
 * ;
 * A part header begins with part of followed by the name of the library the
 * part belongs to. A part declaration consists of a part header followed by a
 * sequence of top-level declarations.
 * It is a compile-time error if the contents of the URI are not a
 * valid part declaration. 
 * @description Checks that it is a compile-time error if the contents of the URI
 * are not a valid part declaration (syntax error in a top-level declaration).
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

library Parts_test_lib;
part "3_Part_8.dart";

main() {
}
