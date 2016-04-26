/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let f be the function immediately enclosing a return statement of
 * the form return; It is a static warning f is neither a generator nor a
 * generative constructor and either:
 *  • f is synchronous and the return type of f may not be assigned to void or,
 *  • f is asynchronous and the return type of f may not be assigned to
 *    Future<Null>.
 *
 * @description Checks that there's no static warning when a statement of the
 * form "return;" is used in an synchronous function whose return type is
 * not specified
 *
 * @static-clean
 * @author a.semenov@unipro.ru
 */

bar() {
  return;
}

class C {
  static sm() {
    return;
  }
  foo() {
    return;
  }
}

main() {
  bar();
  C.sm();
  new C().foo();
}
