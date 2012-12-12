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
 * @description Checks that GenericType1<T> is a subtype of GenericType2<S> where T and S are complex generics. Checks
 * mutual assignability as well.
 * @author iefremov
 * @reviewer rodionov
 */

class I<A, B, C> {}
class J<A, B, C> extends I<A, B, C> {}
class K extends J {}
class C extends K {}

// supposedly, f_1 <=> f and f_2 <=> f (see 13.5)
typedef J f(I<J, List<Map>, num> i, [List j]);
typedef K f_1(I<K, List<Map<int, num>>, int> i, [List<Map> j]);
typedef I f_2(I<K, List<Map<int, num>>, int> i, [List<Map> j]);

I<f, num, List<Map<num, Map>>>  f1() {}

main() {
  Expect.isTrue(new I<f_1, int, List<Map<int, Map<int, int>>>>() is I<f, num, List<Map<num, Map>>>);
  Expect.isTrue(new I<f_2, int, List<Map<int, Map<int, int>>>>() is I<f, num, List<Map<num, Map>>>); // fails
  Expect.isTrue(new J<f_1, int, List<Map<int, Map<int, int>>>>() is I<f, num, List<Map<num, Map>>>);
  Expect.isTrue(new J<f_2, int, List<Map<int, Map<int, int>>>>() is I<f, num, List<Map<num, Map>>>); // fails
  Expect.isTrue(new K() is I<f, num, List<Map<num, Map>>>);
  Expect.isTrue(new C() is I<f, num, List<Map<num, Map>>>);
  
  I<f_1, int, List<Map<int, Map<int, int>>>> v1 = f1();
  I<f, num, List<Map<num, Map>>> v1_ = new I<f_1, int, List<Map<int, Map<int, int>>>>();

  I<f_2, int, List<Map<int, Map<int, int>>>> v2 = f1();
  I<f, num, List<Map<num, Map>>> v2_ = new I<f_2, int, List<Map<int, Map<int, int>>>>();

  J<f_1, int, List<Map<int, Map<int, int>>>> v3 = f1();
  I<f, num, List<Map<num, Map>>> v3_ = new J<f_1, int, List<Map<int, Map<int, int>>>>();

  J<f_2, int, List<Map<int, Map<int, int>>>> v4 = f1();
  I<f, num, List<Map<num, Map>>> v4_ = new J<f_2, int, List<Map<int, Map<int, int>>>>();

  K v5 = f1();
  I<f, num, List<Map<num, Map>>> v5_ = new K();

  C v6 = f1();
  I<f, num, List<Map<num, Map>>> v6_ = new C();
}
