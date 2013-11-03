/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let v be a local variable or a formal parameter. An is-expression
 * of the form v is T shows that v has type T iff T is more specific than the
 * type S of the expression v and both T != dynamic and S != dynamic.
 * @description Checks that if T is dynamic, is-expression does not show that
 * v has type dynamic. Formal parameter case.
 * @static-warning
 * @author ilya
 */
import "../../Utils/expect.dart";

class C {}

f(C x) {
  x is dynamic ? x.unknown() : null; // static warning, would be no warning
                                     // if x was known to have type dynamic
}

main() {
  Expect.throws(() => f(new C()));
}
