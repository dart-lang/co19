/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * (T1 a1,...,Tn an, {Tn+1 xn+1: d1,...,Tn+k xn+k:  dk}) async* {s} is
 * (T1,...,Tn, {Tn+1 xn+1,...,Tn+k xn+k}) -> Stream.
 * In any case where Ti, 1 <= i <= n + k, is not specified, it is considered
 * to have been specified as dynamic.
 * @description Checks that it is a compile error if a function literal
 * of the form (T1 a1,...,Tn an, {Tn+1 xn+1 = d1,...,Tn+k xn+k = dk}) async {s}
 * with two parameters is assigned to a variable of a function type with two
 * parameters that do not correspond to the function literal parameters.
 * @compile-error
 * @author ngl@unipro.ru
 */
import 'dart:async';

typedef Stream streamFuncParam(int p1, {bool p2});

main() {
  streamFuncParam sfp1 = (int p1, {bool p2}) async* {};
  sfp1 = (int p1, {int p2}) async* {};
  sfp1(2);
}
