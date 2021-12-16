// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type T is more specific than a type S, written T << S, if one
/// of the following conditions is met:
///  • T is S.
///  • T is ⊥
///  • S is dynamic.
///  • S is a direct supertype of T.
///  • T is a type parameter and S is the upper bound of T.
///  • T is a type parameter and S is Object.
///  • T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn>
///    and Ti << Si 1 <= i <= n.
///  • T and S are both function types, and T << S under the rules of section
///    (Types/Function Types).
///  • T is a function type and S is Function.
///  • T << U and U << S.
/// << is a partial order on types. T is a subtype of S, written T <: S, iff
/// [⊥/Dynamic]T << S.
/// . . .
/// An interface type T may be assigned to a type S, written T <=> S, if either
/// T <: S or S <: T.
/// @description Checks that GenericType<T> is a subtype of GenericType<S> where
/// T is subtype of S (T and S are non-generic interfaces and/or Dynamic).
/// @author iefremov

import "../../../Utils/expect.dart";

class I {}
class J implements I {}
class K implements J {}

class Z<T> {
  Z() {}
}

main() {
  Expect.isTrue(new List<String>.empty() is List);
  checkType(checkIs<List>, true, new List<String>.empty());
  Expect.isFalse(new List.empty() is List<String>);
  checkType(checkIs<List<String>>, false, new List.empty());
  Expect.isTrue(new List<String>.empty() is List<Object>);
  checkType(checkIs<List<Object>>, true, new List<String>.empty());
  Expect.isTrue(new List<int>.empty() is List<num>);
  checkType(checkIs<List<num>>, true, new List<int>.empty());
  Expect.isTrue(new List<int>.empty() is List);
  checkType(checkIs<List>, true, new List<int>.empty());
  Expect.isTrue(new List<int>.empty() is List<Object>);
  checkType(checkIs<List<Object>>, true, new List<int>.empty());
  Expect.isTrue(new List<double>.empty() is List<Object>);
  checkType(checkIs<List<num>>, true, new List<double>.empty());
  Expect.isTrue(new List<double>.empty() is List);
  checkType(checkIs<List>, true, new List<double>.empty());
  Expect.isTrue(new List<double>.empty() is List<num>);
  checkType(checkIs<List<num>>, true, new List<double>.empty());
  Expect.isTrue(new List<J>.empty() is List);
  checkType(checkIs<List>, true, new List<J>.empty());
  Expect.isTrue(new List<J>.empty() is List<Object>);
  checkType(checkIs<List<Object>>, true, new List<J>.empty());
  Expect.isTrue(new List<J>.empty() is List<I>);
  checkType(checkIs<List<I>>, true, new List<J>.empty());
  Expect.isTrue(new List<K>.empty() is List<I>);
  checkType(checkIs<List<I>>, true, new List<K>.empty());
  Expect.isTrue(new List<K>.empty() is List<J>);
  checkType(checkIs<List<I>>, true, new List<K>.empty());

  Expect.isTrue(new Z<String>() is Z);
  checkType(checkIs<Z>, true, new Z<String>());
  Expect.isFalse(new Z() is Z<String>);
  checkType(checkIs<Z<String>>, false, new Z());
  Expect.isTrue(new Z<String>() is Z<Object>);
  checkType(checkIs<Z<Object>>, true, new Z<String>());
  Expect.isTrue(new Z<int>() is Z<num>);
  checkType(checkIs<Z<num>>, true, new Z<int>());
  Expect.isTrue(new Z<int>() is Z);
  checkType(checkIs<Z>, true, new Z<int>());
  Expect.isTrue(new Z<int>() is Z<Object>);
  checkType(checkIs<Z<Object>>, true, new Z<int>());
  Expect.isTrue(new Z<double>() is Z<Object>);
  checkType(checkIs<Z<Object>>, true, new Z<double>());
  Expect.isTrue(new Z<double>() is Z);
  checkType(checkIs<Z>, true, new Z<double>());
  Expect.isTrue(new Z<double>() is Z<num>);
  checkType(checkIs<Z<num>>, true, new Z<double>());
  Expect.isTrue(new Z<J>() is Z);
  checkType(checkIs<Z>, true, new Z<J>());
  Expect.isTrue(new Z<J>() is Z<Object>);
  checkType(checkIs<Z<Object>>, true, new Z<J>());
  Expect.isTrue(new Z<J>() is Z<I>);
  checkType(checkIs<Z<I>>, true, new Z<J>());
  Expect.isTrue(new Z<K>() is Z<I>);
  checkType(checkIs<Z<I>>, true, new Z<K>());
  Expect.isTrue(new Z<K>() is Z<J>);
  checkType(checkIs<Z<J>>, true, new Z<K>());
}
