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
 * • Otherwise, e is equivalent to the property extraction this.id.
 * @description  Checks that identifier expression can not refer to a static
 * variable in a superclass of the current class.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

class A {
  static var x = 3;
}

class B extends A {
  func() {
    return x;
  }
}

main() {
  new B().func();
}
