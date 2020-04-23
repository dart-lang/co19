/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The NORM relation defines the canonical representative of classes
 * of equivalent types...
 * This is based on the following equations:
 *   FutureOr<T> == T if Future<T> <: T
 *
 * @description Checks that if Future<T> is not subtype of T then
 * FutureOr<T> != T
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import 'dart:async';

class T {}
class A<X> {}
class B<X> implements A<X> {}

  class CT extends B<FutureOr<T>> implements A<T> {}
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  class CN extends B<FutureOr<Null>> implements A<Null> {}
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  class CF extends B<FutureOr<Future>> implements A<Future> {}
//      ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new CT();
  new CN();
  new CF();
}
