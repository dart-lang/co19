/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * T0 id(T1 a1, …, Tn an, [Tn+1  xn+1 = d1, …, Tn+k xn+k = dk]){s}
 * or the form T0 id(T1 a1, …, Tn an, [Tn+1  xn+1 = d1, …, Tn+k xn+k = dk]) => e is
 * (T1, …, Tn, [Tn+1 xn+1, .., Tn+k xn+k]) →T0.
 * In any case where Ti ,1 <= i <= n,  is not specified,
 * it is considered to have been specified as Dynamic.
 * @description Checks that the static type of function literal of the form
 * T0 id(T1 a1, …, Tn an, [Tn+1  xn+1 = d1, …, Tn+k xn+k = dk]){s}
 * or T0 id(T1 a1, …, Tn an, [Tn+1  xn+1 = d1, …, Tn+k xn+k = dk]) => e
 * is (T1, …, Tn, [Tn+1 xn+1, .., Tn+k xn+k]) →T0.
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
  boolFunc bf = bool bf1() => true;
  bf = bool bf2() {1 < 2;};
  bf = bool bf3() => true || false;

  intFunc intf = int intf1()=> 1;
  intf = int intf2() {1 + 2;};
  intf = int intf3() => libf();

  numFunc numf = num nf() => 1;
  numf = num nf() => 1.0;
  numf = int nf() => 1;
  numf = double nf() => 1.0;

  stringFunc sf = String sf1() => "";
  sf = String sf2() {"a" + "b";};

  listFunc lf = List lf1() => [];
  lf = List lf2() {const [1, 2, 3];};

  boolFuncParam bfp = bool bfp1(bool p1, [bool p2]) => false;
  bfp = bool bfp2(bool p1, [bool p2 = false]) {false && true;};

  intFuncParam ifp = int ifp1(int p1, int p2) => 0;
  ifp = int ifp2(int i1, int i2) {return null;};

  stringFuncParam sfp = String sfp1(String s) => "string";
  sfp = String sfp2(String p) {"";};
  sfp = Pattern sfp3(Pattern p) => new RegExp("");

  listFuncParam lfp = List lfp1([Map m = const {}]) => [m];
  lfp = List lfp2([Map m]) {[[m]];};
}
