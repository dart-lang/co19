/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds
 * as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id or id=. If no such declaration exists in the lexical scope, let d be
 * the declaration of the inherited member named id if it exists.
 * ...
 * • If d is the declaration of a library variable, top-level getter or
 *   top-level setter, then e is equivalent to the getter invocation id.
 * @description  Checks that if evaluation of the initializer expression of a
 * library variable is not successful, the variable is initialized with [:null:].
 * @author msyabro
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

dynamic o = '';

var tlVar = o.thatMethod();
int tlTyped = o.thatMethod();
final tlFinal = o.thatMethod();
final int tlFinalTyped = o.thatMethod();


main() {
  try {
    tlVar;
    Expect.fail('NoSuchMethodError is expected');
  } on NoSuchMethodError catch (e) {
    Expect.equals(null, tlVar);
  }

  try {
    tlTyped;
    Expect.fail('NoSuchMethodError is expected');
  } on NoSuchMethodError catch (e) {
    Expect.equals(null, tlTyped);
  }

  try {
    tlFinal;
    Expect.fail('NoSuchMethodError is expected');
  } on NoSuchMethodError catch (e) {
    Expect.equals(null, tlFinal);
  }

  try {
    tlFinalTyped;
    Expect.fail('NoSuchMethodError is expected');
  } on NoSuchMethodError catch (e) {
    Expect.equals(null, tlFinalTyped);
  }
}
