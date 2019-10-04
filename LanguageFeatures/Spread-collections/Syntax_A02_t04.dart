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
 * @description Checks that spreadable set can be declared as constant
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  const Set set1 = {1, 2, 3};
  const  set2 = {14, 18, 99};
  const list3 = [0, 20, 40, 60, 80];

  Expect.setEquals(set1, const {...set1});
  Expect.setEquals(set2, const {...set2});
  Expect.setEquals(list3.toSet(), const {...list3});

  Expect.setEquals({12, 1, 2, 3}, const {12, ...set1});
  Expect.setEquals({1, 2, 3, 12, 20, 30, 10}, const {...set1, 12, 20, 30, 10});

  Expect.setEquals({1, 2, 3, 14, 18, 99, 0, 20, 40, 60, 80},
      const {...set1, ...set2, ...list3});
  Expect.setEquals({11, 1, 2, 3, 12, 16, 94, 0, 20, 40, 60, 80},
      const {11, ...set1, 12, 16, 94, ...list3});
}
