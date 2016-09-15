/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified function invocation i has the form
 * id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k), where id is an identifier.
 * If there exists a lexically visible declaration named id, let fid be the
 * innermost such declaration. Then:
 * . . .
 * Otherwise, . . .
 * If i does not occur inside a top level or static function, i is equivalent to
 * this.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
 * @description Checks that if there is no declaration and i occurs inside
 * an instance method, i is equivalent to this.id()and hence leads to compile
 * error.
 * @compile-error
 * @author ilya
 */

class C {
  test() => undeclared();
}

main() {
  new C().test();
}
