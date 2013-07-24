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
 * • If d is a library variable then:
 *   – If d is of one of the forms var v = ei ; , T v = ei ; , final v = ei ;
 *     or final T v = ei ; and no value has yet been stored into v then the
 *     initializer expression ei is evaluated. If, during the evaluation of ei ,
 *     the getter for v is referenced, a CyclicInitializationError is thrown. If
 *     the evaluation succeeded yielding an object o, let r = o, otherwise
 *     let r = null. In any case, r is stored into v. The value of e is r.
 *   – If d is of one of the forms const v = ei ; or const T v = ei ; then the
 *     value id is the value of the compile-time constant e. Otherwise
 *   – e evaluates to the current binding of id.
 * @description  Checks that the initializer expression is evaluated at
 * the first use of a library variable.
 * @author msyabro
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

class C {
  static var counter = 0;
}

int tlTyped = ++C.counter;
final tlFinal = ++C.counter;
final int tlFinalTyped = ++C.counter;
var tlVar = ++C.counter;


main() {
  Expect.equals(0, C.counter);
  Expect.equals(1, tlVar);
  Expect.equals(1, C.counter);
  Expect.equals(2, tlTyped);
  Expect.equals(2, C.counter);
  Expect.equals(3, tlFinal);
  Expect.equals(3, C.counter);
  Expect.equals(4, tlFinalTyped);
  Expect.equals(4, C.counter);
}
