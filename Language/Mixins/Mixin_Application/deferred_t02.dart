/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the with clause of a mixin
 * application C includes a deferred type expression.
 * @description Checks that it is a compile-time error when with clause
 * includes a deferred type expression.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

import 'deferred_lib.dart' deferred as d;

class B {
}

class C = B with d.A {}

main() {
  new C();
}
