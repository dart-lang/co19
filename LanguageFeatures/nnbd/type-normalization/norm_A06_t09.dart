/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * NORM(C<T0, ..., Tn>) = C<R0, ..., Rn> where Ri is NORM(Ti)
 *
 * @description Checks that NORM(C<T0, ..., Tn>) = C<R0, ..., Rn> where Ri is
 * NORM(Ti). Test FutureOr<T> where Future<T> <: T
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import 'dart:async';

class A<X> {}
class B<X> implements A<X> {}
class C<X> {}

class CO extends B<C<FutureOr<Object>>> implements A<C<Object>> {}
class CD extends B<C<FutureOr<dynamic>>> implements A<C<dynamic>> {}
class CV extends B<C<FutureOr<void>>> implements A<C<void>> {}

main() {
  new CO();
  new CD();
  new CV();
}
