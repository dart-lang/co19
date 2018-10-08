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
 * operator is used correctly (testing simple types as well as generics and
 * function types).
 * @static-clean
 * @author rodionov
 * @reviewer iefremov
 */

abstract class I {}
class C implements I {}

class G<Q, R> {}
class GG<S, T> extends G<S, T> {}

typedef int func(num n, Pattern p);
num f(double d, Pattern p) {return double.nan;}

main() {
  1 as int;
  0 as num;
  double.nan as num;
  "foo" as String;
  "bar" as Pattern;
  new C() as I;
  new GG<int, bool>() as G<int, bool>;
  ((int x, String y) => "$x$y") as func;
  f as func;
  f as Function;
  f as Object;
}
