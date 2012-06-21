/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The cast expression ensures that an object is a member of a type.
 * typeCast:
 *   asOperator type
 * ;
 * asOperator:
 *   as
 * ;
 * @description Checks that there're no errors or warnings when the type cast
 * operator is used correctly (testing simple types as well as generics and function
 * types).
 * @author rodionov 
 * @needsreview issue 3400
 */

interface I {}
class C implements I {}

class G<Q, R> {}
class GG<S, T> extends G<S, T> {}

typedef int func(num, Pattern);
num f(double, Pattern) {return double.NAN;}

main() {
  1 as int;
  0 as num;
  double.NAN as num;
  "foo" as String;
  "bar" as Pattern;
  new C() as I;
  new GG<int, bool>() as G<int, bool>;
  ((int x, String y) => "$x$y") as func; 
  f as func;
}
