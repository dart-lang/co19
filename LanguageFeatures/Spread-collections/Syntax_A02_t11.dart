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
 * @description Checks that spreadable element can be null-aware in spreadable
 * map
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  Map nullMap = null;
  Map a = {};

  Expect.mapEquals({}, {...?nullMap});
  Expect.throws(() => a = {...nullMap});

  Expect.mapEquals({1: 1}, {1: 1, ...?nullMap});
  Expect.throws(() => a = {1: 1, ...nullMap});

  Expect.mapEquals({1: 1}, {...?nullMap, 1: 1});
  Expect.throws(() => a = {...nullMap, 1: 1});
}
