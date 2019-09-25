/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left FutureOr: T0 is FutureOr<S0>
 *   and Future<S0> <: T1
 *   and S0 <: T1
 * @description Check that if a type T0 is FutureOr<S0> and Future<S0> and S0
 * are subtypes of a type T1, then a type T0 is a subtype of a type T1. Case
 * when an instance of T0 is an instance of S0 type and S0 is a generic type
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class A {}
class B extends A {}
class C<X> {
  const C();
}
class S0<X> extends C<X> {}

FutureOr<S0<B>> t0Instance = new S0<B>();
FutureOr<C<A>> t1Instance = new Future<C<A>>.value(new C());

const t1Default = const C<A>();

//# @T0 = FutureOr<S0<B>>
//# @T1 = FutureOr<C<A>>
