/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An instance variable declaration may be declared covariant iff it
 * introduces an implicit setter.
 *
 * @description Check that it is not an error when an instance variable
 * introduces an implicit setter and declared covariant
 * @author sgrekhov@unipro.ru
 * @issue 40805
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class C {
  covariant late final int v1;
  covariant late final int? v2;
  covariant int v3 = 42;
  covariant int? v4;
}

main() {
  new C();
}
