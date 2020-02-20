/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The default bound of generic type parameters is treated as
 * [Object?].
 * @description Check that default non-function typedef type parameter is
 * treated as [Object?] dynamically.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong,nonfunction-type-aliases

import "../../Utils/expect.dart";

class A<T> {}
typedef AAlias<T> = A<T>;

class B<T1, T2, T3> {}
typedef BAlias<T1, T2, T3> = B<T1, T2, T3>;

main() {
  Expect.equals(typeOf<AAlias<Object?>>(), typeOf<AAlias>());
  Expect.equals(typeOf<BAlias<Object?, Object?, Object?>>(), typeOf<BAlias>());
}
