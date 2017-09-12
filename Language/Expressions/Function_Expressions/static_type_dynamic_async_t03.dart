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
 * @description Checks that it is a static type warning if a function literal of
 * the form (T1 a1,...,Tn an, [Tn+1 xn+1 = d1,...,Tn+k xn+k = dk]) async {s}
 * with two parameters is assigned to a variable of a function type with the
 * same parameters and int return type.
 * @static-warning
 * @author ngl@unipro.ru
 */
import '../../../Utils/dynamic_check.dart';

typedef int futureFuncParam(int p1, [int p2]);

main() {
  checkTypeError(() {
    futureFuncParam ffp1 =
        (int p1, [int p2]) async {return 5;}; /// static type warning
    ffp1(3);
  });
}
