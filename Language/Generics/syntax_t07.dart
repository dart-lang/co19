/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration, type alias, or function [G] may be generic,
 * that is, [G] may have formal type parameters declared.
 * . . .
 * typeParameter:
 *   metadata identifier (extends typeNotVoid)?
 * ;
 * typeParameters:
 *   '<' typeParameter (',' typeParameter)* '>'
 * ;
 * @description Checks that opening bracket is a must in the generic class
 * declaration.
 * @compile-error
 * @author iefremov
 */

class C T>{}

main() {
}
