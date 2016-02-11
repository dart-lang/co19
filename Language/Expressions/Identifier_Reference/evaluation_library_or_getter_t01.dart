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
 * @description  Checks that references to a library variables is evaluated
 * correctly and that initializer expression is evaluated only once.
 * @author msyabro
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

var tlVar = new C(1).id;
int tlTyped = new C(2).id;
final tlFinal = new C(3).id;
final int tlFinalTyped = new C(4).id;

class C {
  static Map map = {};
  factory C(i) {
    if (map[i] == null)
      return map[i] = new C._ctor(i);
    else {
      Expect.fail('Initializer expression was evaluated twice');
    }
  }
  var id;
  C._ctor(this.id);
}

main() {
  Expect.equals(1, tlVar);
  Expect.equals(1, tlVar); //The second getter invocation should not evaluate
                           // the initializer expression

  Expect.equals(2, tlTyped);
  Expect.equals(2, tlTyped);

  Expect.equals(3, tlFinal);
  Expect.equals(3, tlFinal);

  Expect.equals(4, tlFinalTyped);
  Expect.equals(4, tlFinalTyped);
}
