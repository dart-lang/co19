/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * (T1 a1,...,Tn an, {Tn+1 xn+1: d1,...,Tn+k xn+k: dk }) {s} is
 * (T1,...,Tn, {Tn+1 xn+1,...,Tn+k xn+k}) -> dynamic.
 * In any case where Ti, 1 <= i <= n + k, is not specified, it is considered
 * to have been specified as dynamic.
 * @description Checks that the static type of function literal of the form
 * (T1 a1,...,Tn an, {Tn+1 xn+1: d1,...,Tn+k xn+k: dk}) {s} is
 * (T1,...,Tn, {Tn+1 xn+1,...,Tn+k xn+k}) -> dynamic and that wherever
 * an argument type of a function literal is not specified, it is considered
 * to have been specified as dynamic.
 * @static-clean
 * @author kaigorodov
 * @reviewer rodionov
 */

typedef dynamic dynFuncBoolParam(bool p1, {bool p2});
typedef dynamic dynFuncIntParam(int p1, {int p2});
typedef dynamic dynFuncStringParam(String p1, {String p2});
typedef dynamic dynFuncListParam(List p1, {List p2});

main() {
  dynFuncBoolParam dfbp = (bool p1, {bool p2}) {return 1;};
  dfbp = (bool p1, {bool p2: true}) {var x = p1;};
  dfbp = (a, {p2}) {};

  dynFuncIntParam dfip = (int p1, {int p2}) {[1][0];};
  dfip = (int p1, {int p2}) {return p1 + p2;};
  dfip = (a, {p2}) {};

  dynFuncStringParam dfsp = (String s1, {String p2}) {return "";};
  dfsp = (String s1, {String p2}) {10 << 2;};
  dfsp = (a, {p2}) {};

  dynFuncListParam dflp = (List p1, {List p2}) {};
  dflp = (List l1, {List p2}) {return {};};
  dflp = (a, {p2}) {};
}
