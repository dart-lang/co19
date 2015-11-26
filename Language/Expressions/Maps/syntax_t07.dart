/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A map literal denotes a map object.
 * mapLiteral:
 *   const? typeArguments? '{' (mapLiteralEntry (',' mapLiteralEntry)* ','?)?
 *   '}'
 * ;
 * mapLiteralEntry:
 *   expression ':' expression
 * ;
 * A map literal consists of zero or more entries. Each entry has a key and a
 * value. Each key and each value is denoted by an expression.
 * @description Checks that it is a compile-time error if a map literal
 * does not begin with '{'.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  try {
    "key": 1 };
  } catch (e) {}
}
