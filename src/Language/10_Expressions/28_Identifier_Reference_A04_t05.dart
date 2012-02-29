/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id. It is a compile-time error if d is a class, interface or type variable. If no such
 * declaration exists in the lexical scope, let d be the declaration of the inherited
 * member named id if it exists. If no such member exists, let d be the declaration
 * of the static member name id declared in a superclass of the current class, if it
 * exists.
 * @description  Checks that identifier expression can refer to a static variable
 * in a superclass of the current class
 * @author msyabro
 * @reviewer kaigorodov 
 */

class A {
  static var x=3;
}

class B extends A {
  func() {
    return x;
  }
}

main() {
  B b = new B();
  Expect.isTrue(b.func()==3);
}