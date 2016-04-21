/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let F be a function with required formal parameters
 * T1 p1, ..., Tn pn, return type T0 and no optional parameters. Then the type
 * of F is (T1 , ..., Tn ) → T0.
 * Let F be a function with required formal parameters T1 p1, ..., Tn pn, return
 * type T0 and positional optional parameters Tn+1 pn+1, ..., Tn+k pn+k. Then
 * the type of F is (T1, ..., Tn, [Tn+1 pn+1, ..., Tn+k pn+k]) → T0.
 * Let F be a function with required formal parameters T1 p1, ..., Tn pn, return
 * type T0 and named optional parameters Tn+1 pn+1, ..., Tn+k pn+k. Then the
 * type of F is (T1, ..., Tn, {Tn+1 pn+1, ..., Tn+k pn+k}) → T0.
 * The run time type of a function object always implements the class Function.
 * @description Checks the type of functions with parameters. Also checks that
 * run time type of a function object always implements the class Function.
 * @static-clean
 * @author ngl@unipro.ru
 */
import "../../../Utils/expect.dart";

typedef int F1(int i1);
typedef int F2(int i1, int i2, [int p3, int p4]);
typedef int F3(int i1, int p2, int p3, {int p4, int p5});

main() {
  int f1(int p1) {return p1;};
  Expect.isTrue(f1 is F1);
  Function f = f1;

  int f2(int p1, int p2, [p3, p4]) {return p1 + p2 + p3 + p4;};
  Expect.isTrue(f2 is F2);
  f = f2;

  int f3(int p1, int p2, int p3, {p4, p5}) {return p1 + p2 + p3;};
  Expect.isTrue(f3 is F3);
  f = f3;

  Expect.isFalse(f1 is F2);
  Expect.isFalse(f1 is F3);
  Expect.isFalse(f2 is F1);
  Expect.isFalse(f2 is F3);
  Expect.isFalse(f3 is F1);
  Expect.isFalse(f3 is F2);

}
