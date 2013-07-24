/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the static type of ai , 1 <= i <= n + k may not be
 * assigned to the type of the corresponding formal parameter of the constructor
 * T.id (respectively T).
 * @description Checks that it is a static type warning if the static type of
 * one of arguments can't be assigned to the type of the corresponding parameter
 * of the named constructor.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/dynamic_check.dart";

class C {
  C.name(int p1) {}
}

main() {
  checkTypeError(() {
    C c = new C.name(""); /// static type warning - incompatible formal parameters, see "Instance creation|New"
  });
}
