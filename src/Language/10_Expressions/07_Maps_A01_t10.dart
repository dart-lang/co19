/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A map literal denotes a map from strings to objects.
 * mapLiteral:
 *   const? typeArguments? '{' (mapLiteralEntry (',' mapLiteralEntry)* ','?)? '}'
 * ;
 * mapLiteralEntry:
 *   stringLiteral ':' expression
 * ;
 * A map literal consists of zero or more entries. Each entry has a key, which is a
 * string literal, and a value, which is an object.
 * @description Checks that it is a compile-time error if a const map literal
 * does not begin with '{'.
 * @compile-error
 * @author kaigorodov
 * @reviewer iefremov
 */

main() {
  try {
    var x= const <String, int>  "key": 1 };
  } catch(e) {}
}
