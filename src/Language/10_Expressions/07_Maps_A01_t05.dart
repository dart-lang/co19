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
 * @description Checks that a map literal can't contain an empty entry.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  try {
    <int>{"key1": 1, "key2" : 2,,"key3":3};
  } catch(e) {}
}