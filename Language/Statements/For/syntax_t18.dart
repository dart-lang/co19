/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The for statement supports iteration.
 * forStatement:
 *   await? for '(' forLoopParts ')' statement
 * ;
 * forLoopParts:
 *   forInitializerStatement expression? ';' expressionList? |
 *   declaredIdentifier in expression |
 *   identifier in expression
 * ;
 * forInitializerStatement:
 *   initializedVariableDeclaration |
 *   expression? ';'
 * ;
 * @description Checks that several valid variations of the asynchronous for-in
 * statement do not cause any errors.
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

test() async {
  int i = 0;
  await for (var i in new Stream.fromIterable([1, 2])) {break;}
  await for (int i  in new Stream.fromIterable([1, 2])) break;
  await for (final i in const Stream.empty()) break;
  await for (final String s in new Stream.fromIterable(['a', 'b', 'c'])) {
    break;
  }
  await for (i in new Stream.fromIterable([1, 2, 3, 4, 5])) break;
}

main() {
  asyncStart();
  test().then(
    (value) => asyncEnd()
  );
}
