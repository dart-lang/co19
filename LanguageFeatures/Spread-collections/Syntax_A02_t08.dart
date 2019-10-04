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
 * Iterable for spreadable set.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  Set set;
  List list;
  List list1 =[1, 2, 3];

  Set a;
  Expect.throws(() => a = {...set});
  Expect.throws(() => a = {"testme", ...set});
  Expect.throws(() => a = {...set, "testme"});

  Expect.throws(() => a = {...list});
  Expect.throws(() => a = {"testme", ...list});
}

