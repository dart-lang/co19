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
 *  • Otherwise, fid is necessarily an instance method or getter of the
 *    enclosing class C, and i is equivalent to the ordinary method invocation
 *    this.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
 * . . .
 * @description Checks that if fid is a instance variable declaration,
 * then i is equivalent to this.id().
 * @author ilya
 */
import '../../../../Utils/expect.dart';

class C {
  var i;
  C(this.i);

  test() {
    Expect.equals(1, i(0));
    Expect.equals(this.i(0), i(0));
  }
}

main() {
  new C((x) => x+1);
}
