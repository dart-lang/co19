/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if S is a direct supertype of T.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that a function type t1 is assignable (no static warnings) to a function type t2 if
 * t1 <: t2 or t1 :> t2 where t1 and t2 are quite complex: non-dynamic return type plus a bunch of 
 * formal and optional parameters. Subtypes of a function type described according to Ch. 13.5.
 * @author iefremov
 * @reviewer rodionov
 * @needsreview issue 3275
 */

#import("../../Utils/dynamic_check.dart");

abstract class A {}
abstract class A1 {}
abstract class A2 {}
abstract class B implements A, A1, A2 {}
abstract class C implements B {}
abstract class D implements C {}

typedef B func(Object o);
typedef B f1(int i, B b, Map<int, num> m, var x, [var ox, B ob, List<num> ol, bool obool]);

//fewer optional parameters
typedef B f1_1(int i, B b, Map<int, num> m, var x, [var ox, B ob, List<num> ol]);
typedef B f1_2(int i, B b, Map<int, num> m, var x, [var ox, B ob]);
typedef B f1_3(int i, B b, Map<int, num> m, var x, [var ox]);
typedef B f1_4(int i, B b, Map<int, num> m, var x);

main() {
  //functions on the right are subtypes of f1
  f1 fvar = B f(int i, B b, Map<int, num> m, var x, [var ox, D ob, List<num> ol, bool obool]){};
  fvar = D f(int i, D b, Map<int, int> m, func x, [func ox, D ob, List<int> ol, bool obool]){};
  fvar = C f(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob, List ol, Object obool]){};
  fvar = A f(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob, List ol, Object obool]){};
  fvar = A f(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob, List ol, Object obool, var more1]){};
  fvar = A f(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob, List ol, Object obool, var more1, int more2]){};

  //functions on the right are supertypes of f1
  checkTypeError(() {
    fvar = C f(num i, A b, Map<Object, Object> m, var x){};
  });
  checkTypeError(() {
    fvar = C f(num i, A b, Map<Object, Object> m, var x, [var ox]){};
  });
  checkTypeError(() {
    fvar = C f(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob]){};
  });
  checkTypeError(() {
    fvar = C f(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob, List ol]){};
  });

  //function on the right is a subtype of f1_*
  f1_1 fvar_1 = B _(int i, B b, Map<int, num> m, var x, [var ox, B ob, List<num> ol, bool obool]) {};
  f1_2 fvar_2 = B _(int i, B b, Map<int, num> m, var x, [var ox, B ob, List<num> ol, bool obool]) {};
  f1_3 fvar_3 = B _(int i, B b, Map<int, num> m, var x, [var ox, B ob, List<num> ol, bool obool]) {};
  f1_4 fvar_4 = B _(int i, B b, Map<int, num> m, var x, [var ox, B ob, List<num> ol, bool obool]) {};
}
