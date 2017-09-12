/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * (T1 a1,...,Tn an, [Tn+1 xn+1 = d1,...,Tn+k xn+k = dk]) sync* {s} is
 * (T1,...,Tn, [Tn+1 xn+1,...,Tn+k xn+k]) -> Iterable.
 * In any case where Ti, 1 <= i <= n + k, is not specified, it is considered
 * to have been specified as dynamic.
 * @description Checks that it is a static type warning if a function literal of
 * the form (T1 a1,...,Tn an, [Tn+1 xn+1 = d1,...,Tn+k xn+k = dk]) sync* {s}
 * with two parameters is assigned to a variable of a function type with the
 * same parameters and Future return type.
 * @static-warning
 * @author ngl@unipro.ru
 */
import 'dart:async';
import '../../../Utils/dynamic_check.dart';

typedef Future iterFuncParam(int p1, [List p2]);

main() {
  checkTypeError(() {
    iterFuncParam ifp1 = (int p1, [List p2]) sync* {}; /// static type warning
    ifp1(6);
  });
}
