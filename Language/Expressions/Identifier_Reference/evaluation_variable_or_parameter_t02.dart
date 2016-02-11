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
 * • If d is a local variable or formal parameter then e evaluates to the
 *   current binding of id.
 * @description Checks that a reference to a local variable is evaluated
 * correctly in closures.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';


main() {
  var x = 0;
  var f = () => x;
  x++;
  Expect.equals(1, x);
  Expect.equals(1, f());

  {
    var x = 4;
    var ff = () => x;
    x++;
    Expect.equals(5, x);
    Expect.equals(1, f());
    Expect.equals(5, ff());
  }
}
