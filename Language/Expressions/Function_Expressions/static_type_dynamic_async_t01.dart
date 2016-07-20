/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * (T1 a1,...,Tn an, [Tn+1 xn+1 = d1,...,Tn+k xn+k = dk]) async {s} is
 * (T1,...,Tn, [Tn+1 xn+1,...,Tn+k xn+k]) -> Future.
 * In any case where Ti, 1 <= i <= n + k, is not specified, it is considered
 * to have been specified as dynamic.
 * @description Checks that the function literal of the form
 * (T1 a1,...,Tn an, [Tn+1 xn+1 = d1,...,Tn+k xn+k = dk]) async {s} may be
 * assigned to function type variables with Future return type and
 * corresponding parameter types.
 * @static-clean
 * @author ngl@unipro.ru
 */
import 'dart:async';

typedef Future futureFunc();
typedef Future futureFuncParam(int p1, [int p2]);

main() {
  futureFunc ff1 = () async {};
  futureFunc ff2 = () async {return true;};
  futureFunc ff3 = () async {return 1;};

  futureFuncParam ffp1 = (int p1, [int p2]) async {};
  futureFuncParam ffp2 = (int p1, [int p2]) async {return true;};
  futureFuncParam ffp3 = (int p1, [int p2]) async {return 1;};
}
