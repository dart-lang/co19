/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A multi-line comment begins with the token '/*' and ends with the
 * token '*/'. Everything between '/*' and '*/' must be ignored by the Dart
 * compiler unless the comment is a documentation comment. Comments may nest.
 * MULTI LINE COMMENT  :
 *   '/''*' (MULTI LINE COMMENT | ~ '*''/')* '*''/'
 * ;
 * @description Checks that it is a compile-time error when a multi-line comment
 * does not have the end token, regardless of whether or not it contains
 * single- and multi-line comment start tokens.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 */

/*  Comment

main() {
}
