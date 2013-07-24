/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if a type variable is supertype of
 * its upper bound.
 * @description Checks that a warning is produced.
 * @static-warning
 * @author pagolubev
 * @reviewer kaigorodov
 * @issue 8424
 */

import "../../Utils/dynamic_check.dart";

class A {}
class B extends A {}

class G<T extends B> {}

main() {
  checkTypeError(() {
    new G<A>(); /// static type warning
  });
}
