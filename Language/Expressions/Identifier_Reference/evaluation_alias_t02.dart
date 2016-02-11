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
 * • If d is a class or type alias T, the value of e is an instance of class
 *   Type (or a subclass thereof) reifying T.
 * @description  Checks that there is no compile-time error if identifier
 * expression in a return statement refers to a function type definition.
 * @author kaigorodov
 * @reviewer rodionov
 */

typedef int add(int a, int b);

class B {
  func() {
    return add;
  }
}

main() {
  B b = new B();
  b.func() == 3;
}
