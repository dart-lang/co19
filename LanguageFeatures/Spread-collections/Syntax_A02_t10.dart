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
 * set
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  List list1 = null;
  List set = null;

  Set a;

  Expect.setEquals([].toSet(), {...?list1});
  Expect.throws(() => a = {...list1});

  Expect.setEquals({12}, {12, ...?list1});
  Expect.throws(() => a = {12, ...list1});

  Expect.setEquals({...?list1, 12}, {12});
  Expect.throws(() => a = {...list1, 12});

  Expect.setEquals([].toSet(), {...?set});
  Expect.throws(() => a = {...set});

  Expect.setEquals({12}, {12, ...?set});
  Expect.throws(() => a = {12, ...set});

  Expect.setEquals({12}, {...?set, 12});
  Expect.throws(() => a = {...set, 12});
}
