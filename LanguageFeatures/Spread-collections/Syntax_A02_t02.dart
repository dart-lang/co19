/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The grammar changes for map and set are a little more complex
 * because of the potential ambiguity of collections containing only spreads.
 * The changed and new rules are:
 *
 *    setOrMapLiteral:
 *    mapLiteral |
 *    setLiteral |
 *    mapOrSetLiteral
 *    ;
 *
 *    mapLiteral:
 *    const? typeArguments? '{' mapLiteralEntryList? '}'
 *    ;
 *
 *    mapLiteralEntryList:
 *    mapLiteralEntry ( ',' mapLiteralEntry )* ','?
 *    ;
 *
 *    mapLiteralEntry:
 *    expression ':' expression |
 *    spread
 *    ;
 *
 *    setLiteral:
 *    'const'? typeArguments? '{' spreadableList '}' ;
 *
 *    mapOrSetLiteral:
 *    'const'?  '{' spread (',' spread)* '}' ;
 *
 * This grammar is ambiguous in cases like [{ ...a }] because [mapLiteral],
 * [setLiteral], and [mapOrSetLiteral] all match. In cases of ambiguity like
 * this, [mapOrSetLiteral] is always chosen. Then the disambiguation happens
 * based on the static types, below.
 *
 * Note that a spread entry for a map is still an expression, not a key/value
 * pair.
 * @description Checks the very simple cases where some values are combined with
 * the existing set or list of different types
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

import "dart:collection";
import "../../Utils/expect.dart";

main() {
  Set set1 = ["abc", "int", "hello"];
  Set set2 = [14, 18, 99];
  List list3 = [0, 2, 4, 6, 8];

  Expect.setEquals(["abc", "int", "hello", 12].toSet(), {...set1, 12});
  Expect.setEquals([12, "abc", "int", "hello"].toSet(), {12, ...set1});

  Expect.setEquals(["abc", "int", "hello", 12, 2, 3, 10].toSet(),
      {...set1, 12, 2, 3, 10});

  Expect.setEquals(["abc", "int", "hello", 14, 18, 99, 0, 2, 4, 6, 8].toSet(),
      {...set1, ...set2, ...list3});
  Expect.setEquals([11, 1, 2, 3, 12, 16, 94, 0, 2, 4, 6, 8].toSet(),
      {11, ...set1, 12, 16, 94, ...list3});
}
