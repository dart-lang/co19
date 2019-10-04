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
 * @description Checks that spreadable map can have type arguments.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  Map map = {1: 10, 2: 20, 3: 30};
  Expect.mapEquals({1: 10, 2: 20, 3: 30}, <int, int>{...map});
  Expect.mapEquals({1: 10, 2: 20, 3: 30, 12: 12}, <int, int>{...map, 12: 12});
  Expect.mapEquals({12: 12, 1: 10, 2: 20, 3: 30}, <int, int>{12: 12, ...map});
}
