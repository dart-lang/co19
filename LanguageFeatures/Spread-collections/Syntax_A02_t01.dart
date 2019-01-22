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
 * @description Checks the very simple cases where some values are combined with
 * the existing set or list of integers
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

import "../../Utils/expect.dart";

main() {
  Set set1 = [1, 2, 3].toSet();
  Set set2 = [14, 18, 99].toSet();
  var list3 = [0, 2, 4, 6, 8];

  Expect.setEquals(set1, {...set1});
  Expect.setEquals(set2, {...set2});
  Expect.setEquals(list3.toSet(), {...list3});

  Expect.setEquals([12, 1, 2, 3].toSet(), {12, ...set1});
  Expect.setEquals([1, 2, 3, 12, 2, 3, 10].toSet(), {...set1, 12, 2, 3, 10});

  Expect.setEquals([1, 2, 3, 14, 18, 99, 0, 2, 4, 6, 8].toSet(),
      {...set1, ...set2, ...list3});
  Expect.setEquals([11, 1, 2, 3, 12, 16, 94, 0, 2, 4, 6, 8].toSet(),
      {11, ...set1, 12, 16, 94, ...list3});

  Expect.setEquals([1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3].toSet(),
      [...set1, ...set1, ...set1, ...set1, ...set1, ...set1]);
}
