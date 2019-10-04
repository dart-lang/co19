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
 * @description Checks that exception is thrown if spreadable element is not
 * set for spreadable map.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  Map map1 = {1: 1, 2: 4, 3: 6};
  Map map2;
  Map a;

  Expect.throws(() => a = {...map2});
  Expect.throws(() => a = {...map1, ...map2});
  Expect.throws(() => a = {...map2, ...map1});
  Expect.throws(() => a = {...map2, 10: 2});
  Expect.throws(() => a = {...map2, 11: 10});
  Expect.throws(() => a = {10: 128, ...map2});
}
