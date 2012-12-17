/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of c is the least upper bound
 * of the static type of e2 and the static type of e3.
 * @description Checks that the static type of a conditional expression is
 * neither Object nor Dynamic.
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../Utils/dynamic_check.dart";

class A {}

main() {
  checkTypeError(() {
    A a = (true ? 1 : 0.5);  /// static type warning
  });
}
