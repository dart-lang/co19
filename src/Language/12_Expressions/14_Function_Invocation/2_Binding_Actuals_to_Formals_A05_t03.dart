/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let Ti be the static type of ai, let Si be the type of pi, i from 1 to h + k and let
 * Sq be the type of the named parameter q of f. It is a static warning if Tj may
 * not be assigned to Sj, j from 1 to m.
 * @description Checks that it is a static warning if the type of an actual argument may
 * not be assigned to the type of a positional parameter of an instance method.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

import "../../../Utils/dynamic_check.dart";

class C {
  foo(int x) {}
  test() {
    checkTypeError(() => foo ('')); /// static type warning
  }
}

main() {
  new C().test();
}
