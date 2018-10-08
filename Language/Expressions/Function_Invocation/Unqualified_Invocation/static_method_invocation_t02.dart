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
 *  • Otherwise, if fid is a static method of the enclosing class C, i is
 *    equivalent to C.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
 * . . .
 * @description Checks that if fid is a static method of the superclass S,
 * then unqualified function invocation expression should produce a
 * compile error
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

class S {
  static m() {}
}

class C extends S {
  test() {
    m();
  }
}

main() {
  new C().test();
}
