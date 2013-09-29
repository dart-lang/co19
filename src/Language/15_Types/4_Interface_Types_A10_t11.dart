/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T is of the form I<T1, ..., Tn> and
 * S is of the form I<S1, ..., Sn> and: Ti << Si , 1 <= i <= n
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T .
 * @description Checks that GenericType<T> is mutually assignable (no static type warnings) with GenericType<S>
 * where T and S are trivial generics.
 * @static-clean
 * @author iefremov
 * @reviewer rodionov
 */

class I {}
class J extends I {}
class K extends J {}
class L extends K {}

typedef J f(List<num> l, [J i]);
typedef I f_1(List<Object> l, [I i]);
typedef K f_2(List<int> l, [L i]);

main() {
  List<List> l1 = (){} ();
  List l1_ = new List<List>();
  
  List<List> l2 = new List<List<List>>();
  List<List<List>> l2_ = new List<List>();
  
  List<List> l3 = new List<List<List<List>>>();
  List<List<List<List>>> l3_ = new List<List>();
  
  List<List<List<List>>> l4 = new List<List<List>>();
  List<List<List>> l4_ = new List<List<List<List>>>(); 
  
  List<List<List<List>>> l5 = new List();
  List l5_ = new List<List<List<List>>>(); 

  List<Map<int, double>> l6 = new List<Map>();
  List<Map> l6_ = new List<Map<int, double>>();

  List<Map<num, num>> l7_super;
  List<Map<int, double>> l7 =  l7_super;
  List<Map<num, num>> l7_ = new List<Map<int, double>>();

  List<f> l8 = new List<f>();
  
  List<f_1> l9 = new List<f>();
  List<f> l9_ = new List<f_1>();

  List<f_2> l10 = new List<f>();
  List<f> l10_ = new List<f_2>();
}
