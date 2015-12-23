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
 *  • If fid is a local function, a library function, a library or static getter
 *    or a variable then i is interpreted as a function expression invocation.
 * . . .
 * @description Checks that if fid is a local variable declaration,
 * then i is interpreted as a function expression invocation.
 * @author ilya
 */
import '../../../../Utils/expect.dart';

main() {
  var v1 = (x) => x;
  f(x) {
    var v2 = () => v1(x + 1);
    Expect.equals(1, v1(x) + v2());
  }
  f(0);
}
