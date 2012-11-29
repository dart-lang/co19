/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is as static warning if an identiﬁer expression id occurs inside
 * a top level or static function (be it function, method, getter, or setter)
 * or variable initializer and there is no declaration d with name id in the lexical
 * scope enclosing the expression.
 * @description  Checks that identifier expression can not occur inside
 * a static method.
 * @compile-error
 * @author kaigorodov
 */

class A {
  static func() {
    return indeclared;
  }
}

main() {
  var x=A.func();
}
