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
 * @description Checks that constructor specified in a redirect clause is
 * invoked.
 * @author vasya
 */
import "../../../../Utils/expect.dart";

class C {
  C(foo, bar) : this.init(foo, bar);
  C.init(foo, bar) : _foo = foo, _bar = bar;

  C.ctor(foo) : this(foo, 1);

  var _foo;
  var _bar;
}

main() {
  C c = new C(1,2);
  Expect.equals(1, c._foo);
  Expect.equals(2, c._bar);

  c = new C.ctor(42);
  Expect.equals(42, c._foo);
  Expect.equals(1, c._bar);
}
