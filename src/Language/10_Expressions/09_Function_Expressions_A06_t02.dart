/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * (T1 a1, ..., Tn an, {Tn+1 xn+1: d1, ..., Tn+k xn+k: dk }){s} is
 * (T1 ..., Tn, {Tn+1 xn+1, ..., Tn+k xn+k }) → dynamic.
 * In any case where Ti , 1 ≤ i ≤ n + k, is not speciﬁed,
 * it is considered to have been speciﬁed as dynamic.
 * @description Checks that a static warning occurs when assigning a function literal
 * of the form (T1 a1, ..., Tn an, {Tn+1  xn+1 = d1,... Tn+k xn+k = dk}){s}
 * to a variable of a function type with incompatible parameter types.
 * @static-warning
 * @author kaigorodov
 */

#import('../../Utils/dynamic_check.dart');

typedef int foo(int x, String y, {double a, double b});

main() {
  foo f;
  checkTypeError( () {f = id(int x, int y, {double a, double b}) {};});
}
