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
 * @description Check that if a type T0 is FutureOr<S0> and Future<S0> is a
 * subtype of T1 but S0 is not a subtype of a type T1, then a type T0 is not a
 * subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "dart:async";

class S0 {}

FutureOr<S0> t0Instance = new S0();
Future<S0> t1Instance = new Future<S0>.value(new S0()); // S0 is not a subtype of T1 (T1 is Future<S0>)

//# @T0 = FutureOr<S0>
//# @T1 = Future<S0>
