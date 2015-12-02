/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * (T1 a1,...,Tn an, {Tn+1 xn+1: d1,...,Tn+k xn+k: dk }) => e is
 * (T1,...,Tn, {Tn+1 xn+1,...,Tn+k xn+k }) -> T0, where T0 is the static type
 * of e.
 * In any case where Ti, 1 <= i <= n + k, is not specified, it is considered
 * to have been specified as dynamic.
 * @description Checks that the static type of function literal of the form
 * (T1 a1,...,Tn an, {Tn+1 xn+1: d1,...,Tn+k xn+k: dk}) => e or
 * id(T1 a1,...,Tn an, {Tn+1 xn+1: d1,...,Tn+k xn+k: dk}) => e is
 * (T1,...,Tn, {Tn+1 xn+1,...,Tn+k xn+k}) -> T0.
 * @static-clean
 * @author kaigorodov
 * @reviewer rodionov
 */

typedef bool boolFuncParam(bool p1, {bool p2});
typedef List listFuncParam({Map m});

main() {
  boolFuncParam bfp = (bool p1, {bool p2}) => false;
  bfp = (bool p1, {bool p2: false}) => false && true;

  listFuncParam lfp = ({Map m: const {}}) => [m];
  lfp = ({Map m}) => [[m]];
}
