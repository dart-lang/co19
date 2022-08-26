// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

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
  Expect.isTrue(<String>[] is List);
  Expect.isFalse([] is List<String>);
  Expect.isTrue(<String>[] is List<Object>);
  Expect.isTrue(<String>[] is List<Object>);
  Expect.isTrue(<int>[] is List<num>);
  Expect.isTrue(<int>[] is List);
  Expect.isTrue(<int>[] is List<Object>);
  Expect.isTrue(<double>[] is List<Object>);
  Expect.isTrue(<double>[] is List);
  Expect.isTrue(<double>[] is List<num>);
  Expect.isTrue(<J>[] is List);
  Expect.isTrue(<J>[] is List<Object>);
  Expect.isTrue(<J>[] is List<I>);
  Expect.isTrue(<K>[] is List<I>);
  Expect.isTrue(<K>[] is List<J>);

  Expect.isTrue(new Z<String>() is Z);
  Expect.isFalse(new Z() is Z<String>);
  Expect.isTrue(new Z<String>() is Z<Object>);
  Expect.isTrue(new Z<String>() is Z<Object>);
  Expect.isTrue(new Z<int>() is Z<num>);
  Expect.isTrue(new Z<int>() is Z);
  Expect.isTrue(new Z<int>() is Z<Object>);
  Expect.isTrue(new Z<double>() is Z<Object>);
  Expect.isTrue(new Z<double>() is Z);
  Expect.isTrue(new Z<double>() is Z<num>);
  Expect.isTrue(new Z<J>() is Z);
  Expect.isTrue(new Z<J>() is Z<Object>);
  Expect.isTrue(new Z<J>() is Z<I>);
  Expect.isTrue(new Z<K>() is Z<I>);
  Expect.isTrue(new Z<K>() is Z<J>);
}
