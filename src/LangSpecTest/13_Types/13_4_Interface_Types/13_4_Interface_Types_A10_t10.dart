/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T is of the form I<T1, ..., Tn> and
 * S is of the form I<S1, ..., Sn> and: Ti << Si , 1 <= i <= n
 * << is a partial order on types. T is a subtype of S, written T <: S, if [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T .
 * @description Checks that GenericType<T> is mutually assignable with GenericType<S> (no static type warnings)
 * where T is a subtype of S (T and S are non-generic interfaces and/or Dynamic).
 * @author iefremov
 * @reviewer rodionov
 */

interface I {}
interface J extends I {}
interface K extends J {}

class Z<T> {
  Z() {}
}

main() {
  List<String> l1 = new List();
  List l2 = new List<String>();

  List<String> l3 = new List<Object>();
  List<Object> l3_ = new List<String>();
  
  List<int> l4 = new List<num>();
  List<num> l4_ = new List<int>();
  
  List<int> l5 = new List<Object>();
  List<Object> l5_ = new List<int>();
  
  List<double> l6 = new List<Object>();
  List<Object> l6_ = new List<double>();
  
  List<double> l7 = new List<num>();
  List<num> l7_ = new List<double>();
  
  List<J> l8 = new List<Object>();
  List<Object> l8_ = new List<J>();
  
  List<J> l9 = new List<I>();
  List<I> l9_ = new List<I>();
  
  List<K> l10 = new List<I>();
  List<I> l10_ = new List<K>();
  
  List<K> l11 = new List<J>();
  List<J> l11_ = new List<K>();

  List<int> l12 = new List();
  
  List<double> l13 = new List();
  
  List<J> l14 = new List();
  
  List<String> z1 = new List();
  List z2 = new List<String>();

  Z<String> z3 = new Z<Object>();
  Z<Object> z3_ = new Z<String>();
  
  Z<int> z4 = new Z<num>();
  Z<num> z4_ = new Z<int>();
  
  Z<int> z5 = new Z<Object>();
  Z<Object> z5_ = new Z<int>();
  
  Z<double> z6 = new Z<Object>();
  Z<Object> z6_ = new Z<double>();
  
  Z<double> z7 = new Z<num>();
  Z<num> z7_ = new Z<double>();
  
  Z<J> z8 = new Z<Object>();
  Z<Object> z8_ = new Z<J>();
  
  Z<J> z9 = new Z<I>();
  Z<I> z9_ = new Z<J>();
  
  Z<K> z10 = new Z<I>();
  Z<I> z10_ = new Z<K>();
  
  Z<K> z11 = new Z<J>();
  Z<J> z11_ = new Z<K>();

  Z<int> z12 = new Z();
  
  Z<double> z13 = new Z();
  
  Z<J> z14 = new Z();
}
