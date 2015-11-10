/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The type parameters of a generic G are in scope in the bounds of
 * all of the type parameters of G. The type parameters of a generic class
 * declaration G are also in scope in the extends and implements clauses of G
 * (if these exist) and in the body of G.
 * @description Checks bounds of type parameters are checked at runtime.
 * @static-warning
 * @author iefremov
 * @reviewer kaigorodov
 */

import "../../Utils/dynamic_check.dart";

class Enum<E extends Enum<E>> {}

main() {
  checkTypeError(() {
    var x = new Enum<int>(); /// static type warning
  });
}
