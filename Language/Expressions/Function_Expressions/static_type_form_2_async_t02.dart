/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * (T1 a1,...,Tn an, {Tn+1 xn+1: d1,...,Tn+k xn+k: dk }) async => e is
 * (T1,...,Tn, {Tn+1 xn+1,...,Tn+k xn+k }) -> Future<flatten(T0)>, where T0 is
 * the static type of e.
 * In any case where Ti, 1 <= i <= n + k, is not specified, it is considered
 * to have been specified as dynamic.
 * @description Checks that it is a compile error if a function literal of
 * the form (T1 a1,...,Tn an, {Tn+1 xn+1 = d1,...,Tn+k xn+k = dk}) async => e
 * with two parameters is assigned to a variable of a function type with three
 * parameters.
 * @compile-error
 * @author ngl@unipro.ru
 */
import 'dart:async';

typedef Future<bool> boolFuncParam(bool p1, bool p2, {bool p3});

main() {
  boolFuncParam bfp = (bool p1, bool p2, {bool p3}) async => true;
  bfp = (bool p1, {bool p2}) async => false;
}
