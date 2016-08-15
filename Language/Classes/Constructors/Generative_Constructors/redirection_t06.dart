/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generative constructor may be redirecting, in which case its
 * only action is to invoke another generative constructor. A redirecting
 * constructor has no body; instead, it has a redirect clause that specifies
 * which constructor the invocation is redirected to, and with what arguments.
 * redirection:
 *   ':' this ('.' identifier)? arguments
 * ;
 * @description Checks that constructor redirection cannot be combined with a
 * superinitializer.
 * @compile-error
 * @author pagolubev
 */

class A {}

class C extends A {
  C() : super(), this.init();
  C.init();
}

main() {
  try {
    var x = new C();
  } catch (x) {}
}
