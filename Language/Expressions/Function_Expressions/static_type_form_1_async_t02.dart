/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * (T1 a1,...,Tn an, [Tn+1 xn+1 = d1,...,Tn+k xn+k = dk]) async => e is
 * (T1,...,Tn, [Tn+1 xn+1,...,Tn+k xn+k]) -> Future <flatten(T0)>, where T0
 * is the static type of e and flatten(T0) is defined as follows:
 * If T = Future<S> then flatten(T) = flatten(S).
 * Otherwise if T <: Future then let S be a type such that T << Future<S> and
 * for all R, if T << Future<R> then S << R.
 * In any case where Ti, 1 <= i <= n + k, is not specified, it is considered
 * to have been specified as dynamic.
 * @description Checks that it is a compile error if a function literal of
 * the form (T1 a1,...,Tn an, [Tn+1 xn+1 = d1,...,Tn+k xn+k = dk]) async => e
 * with two parameters is assigned to a variable of a function type without
 * parameters.
 * @compile-error
 * @author ngl@unipro
 */
import 'dart:async';

typedef Future<int> intFunc();

main() {
  intFunc intf = () async => 2;
  intf = (int p1, [int p2]) async => 1;
}
