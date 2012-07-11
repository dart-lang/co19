/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of the cast expression e as T proceeds as follows:
 * The expression e is evaluated to a value v. Then, if the interface of the class
 * of v is a subtype of T, the cast expression evaluates to v. Otherwise, if v is null,
 * a NullPointerException is thrown. In all other cases, a CastException is thrown.
 * @description Checks that the type cast operator works as specified when the
 * type of v is a subtype of T.
 * @author rodionov
 * @reviewer iefremov
 */

interface I {}
class C implements I {
  C(this.x);
  int x;
}

main() {
  Expect.equals(1, 1 as int);
  Expect.equals(0, 0 as num);
  Expect.equals("foo", "foo" as String);
  Expect.equals("bar", "bar" as Pattern);
  var c = new C(1);
  Expect.identical(c, c as I);
}
