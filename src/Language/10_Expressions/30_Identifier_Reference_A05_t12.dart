/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id.
 *  - If d is a library variable then:
 *    If d is of one of the forms var v = ei; , T var v = ei; , final v = ei; or final T v = ei;
 * and no value has yet been stored into v then the initializer expression ei is evaluated.
 * If the evaluation succeeded yielding an object o, let r = o, otherwise let r = null.
 * In any case, r is stored into v. The value of e is r. Otherwise
 *    e evaluates to the current binding of id.  This case also applies if d is a library function declaration,
  * as these are equivalent to function-valued variable declarations.
 *  - If d is a local variable or formal parameter then e evaluates to the current binding of id.
 * This case also applies if d is a local function declaration,
 * as these are equivalent to function-valued variable declarations.
 *  - If d is a static method, then e evaluates to the function defined by d.
 *  - If d is the declaration of a static variable or static getter declared in class
 * C, then e is equivalent to the getter invocation C.id.
 *  - If d is the declaration of a top level getter, then e is equivalent to the
 * getter invocation id.
 *  - Otherwise, e is equivalent to the property extraction this.id.
 * @description Checks that a reference to a variable in a loop is evaluated correctly in closures
 * nested inside that loop.
 * @author msyabro
 * @reviewer rodionov
 */


main() {
  var acc = [];
  for(var i = 0; i < 10; ++i, () {acc.add(i);}());
  Expect.listEquals([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], acc);

  var count = 0;
  for(var i = 0; () {return i < 10;} (); i++) ++count;
  Expect.equals(10, count);

  var list = [1, 2, 3, 4, 5];
  var anotherList = [];
  for(var x in list) {
    anotherList.add(() {return x;} ());
  }
  Expect.listEquals(list, anotherList);
}
