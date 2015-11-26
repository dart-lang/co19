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
 * @description Checks that a map literal can't begin with an empty entry.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  try {
    var map=<String, int>{, "key1": 1, "key2" : 2, "key3": 3};
  } catch (e) {}
}
