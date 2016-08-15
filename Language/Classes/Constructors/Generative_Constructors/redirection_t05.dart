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
 * @description Checks that redirecting constructor can not have initializing
 * formals.
 * @compile-error
 * @author pagolubev
 */

class C {
  C(this.x) : this.init();
  C.init();
  var x;
}

main() {
  try {
    var x = new C(1);
  } catch (x) {}
}
