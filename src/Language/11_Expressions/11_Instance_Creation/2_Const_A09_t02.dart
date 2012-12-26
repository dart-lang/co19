/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a constant object expression of either the form
 * const T.id(a1, .., an) or the form const T(a1, .., an) is T.
 * It is a static warning if the static type of ai, 1 <= i <= n+ k may not be assigned
 * to the type of the corresponding formal parameter of the constructor T.id (respectively T).
 * @description Checks that it is a static warning if the static type of arguments may not
 * be assigned to the type of the corresponding formal parameter of the invoked constant constructor of T.
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/dynamic_check.dart";

class A {
  const A(int p1, int p2);
}

main() {
  checkTypeError(() {
    const A(0x1, "2"); /// static type warning - incompatible formal parameters, see "Instance creation|Const"
  });
}
