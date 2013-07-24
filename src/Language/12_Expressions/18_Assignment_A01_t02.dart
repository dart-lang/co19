/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form v = e proceeds as follows:
 * @assertion Evaluation of an assignment a of the form v = e proceeds as follows:
 * If there is no declaration d with name v = in the lexical scope enclosing a, then:
 * - If a occurs inside a top level or static function (be it function, method,
 *   getter, or setter) or variable initializer, evaluation of a causes a 
 *   NoSuchMethodError to be thrown.
 * - Otherwise, the assignment is equivalent to the assignment this.v = e.
 * Otherwise, let d be the innermost declaration whose name is v, if it exists.
 * If d is the declaration of a local or library variable, the expression e is evaluated
 * to an object o. Then, the variable v is bound to o. The value of the
 * assignment expression is o.
 * Otherwise, if d is the declaration of a static variable in class C, then the
 * assignment is equivalent to the assignment C.v = e.
 * Otherwise, the assignment is equivalent to the assignment this.v = e.
 * @description Checks that the value of the assignment expression of the form v = e
 * is e evaluated to o.
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

main() {
  var v;
  Expect.equals(1, v = 1);
  Expect.equals(2, v = 2);
  Expect.equals(1, v = 1);
  Expect.equals(3, v = 1 + 2);
}
