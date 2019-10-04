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
 * the existing map
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  Map map1 = {1: 1, 2: 4, 3: 6};
  Map map2 = {11: 28, 4: 7, 31: 12};
  Map map3 = {0: 0, 7: 2, 5: 4, 6: 6, 8: 8};

  Expect.mapEquals(map1, {...map1});
  Expect.mapEquals(map2, {...map2});
  Expect.mapEquals(map3, {...map3});

  Expect.mapEquals({12: 28, 1: 1, 2: 4, 3: 6}, {12: 28, ...map1});
  Expect.mapEquals({1: 1, 2: 4, 3: 6, 12: 3, 112: 4, 33: 0, 10: 14},
      {...map1, 12: 3, 112: 4, 33: 0, 10: 14});

  Expect.mapEquals(
      {1: 1, 2: 4, 3: 6, 11: 28, 4: 7, 31: 12, 0: 0, 7: 2, 5: 4, 6: 6, 8: 8},
      {...map1, ...map2, ...map3});

  Expect.mapEquals({18: 2, 1: 1, 2: 4, 3: 6, 0: 14, 11: 23},
      {18: 2, ...map1, 0: 14, 11: 23});

  Expect.mapEquals({18: 2, 1: 1, 2: 4, 3: 6, 100: 14, 111: 23, 11: 28, 4: 7,
        31: 12, 48: 299, 88: 41, 999: 14, 1000: 333,  0: 0, 7: 2, 5: 4, 6: 6,
        8: 8, 64: 39},
      {18: 2, ...map1, 100: 14, 111: 23, ...map2, 48: 299, 88: 41, 999: 14,
        1000: 333, ...map3, 64: 39});
}
