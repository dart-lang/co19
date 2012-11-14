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
 * @description Checks that GenericType<T> is a subtype of GenericType<S> where T and S are simple functions.
 * @author iefremov
 * @reviewer rodionov
 */

class I0 {}
class I1 extends I0 {}
class I2 extends I1 {}
class I3 extends I2 {}
class I4 extends I2 {}

class G<T> {}

typedef t1();
typedef void t1_1(); // void <: Dynamic
typedef G<List<t1>> t1_2();

typedef I2 t2(I2 i, [I2 j]);
typedef I0 t2_1(I0 i, [I0 j]);
typedef I4 t2_2(I4 i, [I4 j]);
typedef I4 t2_3(I0 i, [I4 j]);
typedef I0 t2_4(I4 i, [I0 j]);

typedef t1 t3(t1 f1, [t1 f2]);
typedef t1_1 t3_1(t1_1 f1, [t1_1 f2]);
typedef t1_2 t3_2(t1_2 f1, [t1_2 f2]);

main() {
  Expect.isTrue(new List<t1>() is List<t1>);
  Expect.isTrue(new List<t1_1>() is List<t1>);
  Expect.isTrue(new List<t1_2>() is List<t1>);

  Expect.isTrue(new List<t2>() is List<t2>);
  Expect.isTrue(new List<t2_1>() is List<t2>);
  Expect.isTrue(new List<t2_2>() is List<t2>);
  Expect.isTrue(new List<t2_3>() is List<t2>);
  Expect.isTrue(new List<t2_4>() is List<t2>);

  Expect.isTrue(new List<t3>() is List<t3>);
  Expect.isTrue(new List<t3_1>() is List<t3>);
  Expect.isTrue(new List<t3_2>() is List<t3>);
}
