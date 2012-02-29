/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * id(T1 a1, …, Tn an, [Tn+1  xn+1 = d1,… Tn+k xn+k = dk]){s} or the form
 * (T1 a1, …, Tn an, [Tn+1  xn+1 = d1, …, Tn+k xn+k = dk]) {s} is
 * (T1, …, Tn, [Tn+1 xn+1, .., Tn+k xn+k]) → Dynamic.
 * In any case where Ti ,1 <= i <= n,  is not specified,
 * it is considered to have been specified as Dynamic.
 * @description Checks that the static type of function literal of the form
 * id(T1 a1, …, Tn an, [Tn+1  xn+1 = d1,… Tn+k xn+k = dk]){s} or
 * (T1 a1, …, Tn an, [Tn+1  xn+1 = d1, …, Tn+k xn+k = dk]) {s} is
 * T1, …, Tn, [Tn+1 xn+1, .., Tn+k xn+k]) → Dynamic and that wherever
 * an argument type of a function literal is not specified, 
 * it is considered to have been specified as Dynamic.
 * @author msyabro
 * @reviewer rodionov
 */

typedef Dynamic dynFunc();
typedef Dynamic dynFuncBoolParam(bool p1, [bool p2]);
typedef Dynamic dynFuncIntParam(int p1, [int p2]);
typedef Dynamic dynFuncStringParam(String p1, [String p2]);
typedef Dynamic dynFuncListParam(List p1, [List p2]);

main() {
  dynFunc df = () {};
  df = f() {};

  dynFuncBoolParam dfbp = (bool p1, [bool p2]) {return 1;};
  dfbp = f1(bool p1, [bool p2 = true]) {var x = p1;};
  dfbp = f1(a, [p2]) {};

  dynFuncIntParam dfip = (int p1, [int p2]) {[1][0];};
  dfip = f2(int p1, [int p2]) {return p1 + p2;};
  dfip = f1(a, [p2]) {};

  dynFuncStringParam dfsp = (String s1, [String p2]) {return "";};
  dfsp = f3(String s1, [String p2]) {10 << 2;};
  dfsp = f1(a, [p2]) {};

  dynFuncListParam dflp = (List p1, [List p2]) {};
  dflp = f4(List l1, [List p2]) {return {};};
  dflp = f1(a, [p2]) {};
}
