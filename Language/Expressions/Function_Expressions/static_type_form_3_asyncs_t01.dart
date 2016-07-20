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
 * @description Checks that the static type of function literal of the form
 * (T1 a1,...,Tn an, {Tn+1 xn+1: d1,...,Tn+k xn+k: dk]) async* {s} may be
 * assigned to function type variables with Stream return type and
 * corresponding parameter types.
 * @static-clean
 * @author ngl@unipro.ru
 */
import 'dart:async';

typedef Stream streamFunc();
typedef Stream streamFuncParam(int p1, {bool p2});

main() {
  streamFunc sf1 = () async* {};
  streamFuncParam sfp1 = (int p1, {bool p2}) async* {};
}
