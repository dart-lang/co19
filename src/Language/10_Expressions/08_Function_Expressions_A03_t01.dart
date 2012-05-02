/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * (T1 a1, ..., Tn an, [Tn+1  xn+1 = d1, ... ,Tn+k xn+k = dk]) => e or the form
 * id(T1 a1, ..., Tn an, [Tn+1  xn+1 = d1, ..., Tn+k xn+k = dk]) => e is
 * (T1, ..., Tn, [Tn+1 xn+1, .., Tn+k xn+k]) -> T0, where T0 is the static type of e.
 * In any case where Ti ,1 <= i <= n,  is not specified,
 * it is considered to have been specified as Dynamic.
 * @description Checks that the static type of function literal of the form
 * (T1 a1, ..., Tn an, [Tn+1  xn+1 = d1, ... ,Tn+k xn+k = dk]) => e
 * or id(T1 a1, ..., Tn an, [Tn+1  xn+1 = d1, ..., Tn+k xn+k = dk]) => e
 * is (T1, ..., Tn, [Tn+1 xn+1, .., Tn+k xn+k]) -> T0
 * @author msyabro
 * @reviewer rodionov
 */

int libf() {}

typedef bool boolFunc();
typedef int intFunc();
typedef num numFunc();
typedef String stringFunc();
typedef List listFunc();

typedef bool boolFuncParam(bool p1, [bool p2]);
typedef int intFuncParam(int p1, int p2);
typedef String stringFuncParam(String s);
typedef List listFuncParam([Map m]);

main() {
  boolFunc bf = () => true;
  bf = f() => 1 < 2;
  bf = g() => true || false;

  intFunc intf = ()=> 1;
  intf = i() => 1 + 2;
  intf = i() => libf();
  
  numFunc numf = () => 1;
  numf = () => 1.0;
  numf = i() => 0;

  stringFunc sf = s() => "";
  sf = () => "a""b";

  listFunc lf = l() => [];
  lf = () => const [1, 2, 3];

  boolFuncParam bfp = (bool p1, [bool p2]) => false;
  bfp = f1(bool p1, [bool p2 = false]) => false && true;

  intFuncParam ifp = (int p1, int p2) => 0;
  ifp = f2(int i1, int i2) => 1 - 2;

  stringFuncParam sfp = (String s) => "string";
  sfp = f3(String p) => "";

  listFuncParam lfp = ([Map m = const {}]) => [m];
  lfp = f4([Map m]) => [[m]];
}
