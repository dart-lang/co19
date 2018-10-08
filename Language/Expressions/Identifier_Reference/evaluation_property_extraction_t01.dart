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
 * @description Checks that latter case is evaluated correctly.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

class A {
  A() : y = 10;

  func() {
    Expect.equals(10, y);
  }

  var y;
}

main() {
  A a = new A();
  a.func();
}
