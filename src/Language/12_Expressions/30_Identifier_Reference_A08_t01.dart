/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id. If no such declaration exists in the lexical scope, let d be the declaration
 * of the inherited member named id if it exists.
 * ...
 * • If d is the declaration of a library variable or top-level getter, then
 * e is equivalent to the getter invocation id.
 * @description  Checks that references to a library variables is evaluated correctly
 * and that initializer expression is evaluated only once.
 * @author msyabro
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

var tlVar = new C().foo();
int tlTyped = new C().foo();
final tlFinal = new C().foo();
final int tlFinalTyped = new C().foo();


class C {
  C() {
    Expect.equals(0, counter, 'Initializer expression was evaluated twice');
    ++counter;
  }
  foo() {
    Expect.equals(1, counter, 'Initializer expression was evaluated twice');
    ++counter;
    return counter;
  }
  var counter = 0;
}

main() {
  Expect.equals(2, tlVar);
  Expect.equals(2, tlVar); //The second getter invocation should not evaluate the initializer expression

  Expect.equals(2, tlTyped);
  Expect.equals(2, tlTyped);

  Expect.equals(2, tlFinal);
  Expect.equals(2, tlFinal);

  Expect.equals(2, tlFinalTyped);
  Expect.equals(2, tlFinalTyped);
}
