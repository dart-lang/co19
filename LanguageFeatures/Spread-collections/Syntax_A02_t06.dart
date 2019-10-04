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
 * @description Checks that spreadable map can be declared as constant.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  const Map map1 = {1: 1, 2: 4, 3: 6};
  const Map map2 = {11: 28, 4: 7, 31: 12};
  const Map map3 = {0: 0, 7: 2, 5: 4, 6: 6, 8: 8};

  Expect.mapEquals(map1, const {...map1});
  Expect.mapEquals(map2, const {...map2});
  Expect.mapEquals(map3, const {...map3});

  Expect.mapEquals({12: 28, 1: 1, 2: 4, 3: 6}, const {12: 28, ...map1});
  Expect.mapEquals({1: 1, 2: 4, 3: 6, 12: 3, 112: 4, 33: 0, 10: 14},
      const {...map1, 12: 3, 112: 4, 33: 0, 10: 14});

  Expect.mapEquals(
      {1: 1, 2: 4, 3: 6, 11: 28, 4: 7, 31: 12, 0: 0, 7: 2, 5: 4, 6: 6, 8: 8},
      const {...map1, ...map2, ...map3});

  Expect.mapEquals({18: 2, 1: 1, 2: 4, 3: 6, 0: 14, 11: 23},
      const {18: 2, ...map1, 0: 14, 11: 23});

  Expect.mapEquals({18: 2, 1: 1, 2: 4, 3: 6, 100: 14, 111: 23, 11: 28, 4: 7,
        31: 12, 48: 299, 88: 41, 999: 14, 1000: 333,  0: 0, 7: 2, 5: 4, 6: 6,
        8: 8, 64: 39},
      const {18: 2, ...map1, 100: 14, 111: 23, ...map2, 48: 299, 88: 41, 999: 14,
        1000: 333, ...map3, 64: 39});
}
