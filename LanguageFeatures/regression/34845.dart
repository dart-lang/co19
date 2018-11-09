/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the Issue 34845 (see comments there: With
 * that, we have [dynamic] == [FutureOr<dynamic>] ==
 * [FutureOr<FutureOr<dynamic>>] == ..., which makes cases 1–3 OK. So I think
 * the analyzer is right here. Checks that [dynamic] == [FutureOr<dynamic>] ==
 * [FutureOr<FutureOr<dynamic>>] == ...
 * @Issue 34845
 * @author iarkh@unipro.ru
 */

import "dart:async";

typedef F<X> = void Function<Y extends X>();
F<X> toF<X>(X x) => null;

class A<X extends FutureOr<X>> {}

main() {
  A source;
  var fsource = toF(source);
  F<A<FutureOr<dynamic> >> target = fsource;
  F<A<dynamic>> target1 = fsource;
  F<A<FutureOr<FutureOr<dynamic>>>> target2 = fsource;
  F<A<FutureOr<FutureOr<FutureOr<dynamic>>>>> target3 = fsource;
}
