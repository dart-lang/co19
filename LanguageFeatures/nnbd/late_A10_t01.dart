/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An instance variable declaration may be declared covariant iff it
 * introduces an implicit setter.
 *
 * @description Check that it is an error if an instance variable is declared
 * covariant but doesn't introduces an implicit setter
 * @author sgrekhov@unipro.ru
 * @issue 40941
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class C {
  covariant late final int v1 = 42;
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified

  covariant final int v2 = 42;
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
}
