// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Two objects T1 and T2 which are instances of Type (that is,
/// runtime type objects) are considered equal if and only if the runtime type
/// objects T1 and T2 corresponds to the types S1 and S2 respectively, and the
/// normal forms NORM(S1) and NORM(S2) are syntactically equal up to equivalence
/// of bound variables and ignoring * modifiers on types.
/// ...
/// Two constant type literals T1 and T2 compare as identical if they are equal
/// using the definition of runtime type equality specified above.
///
/// @description Checks that two constant type literals `T1` and `T2` are
/// identical if they are equal according to the runtime type equality.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../Utils/expect.dart";

typedef NullableInt = int?;
typedef DoubleNullableInt = NullableInt?;
typedef NullableNever = Never?;
typedef NullableNull = Null?;
typedef NullableDynamic = dynamic?;
typedef Void = void;
typedef NullableVoid = Void?;
typedef NullableObject = Object?;
typedef DoubleNullableObject = NullableObject?;
typedef NullableFutureNull = Future<Null>?;
typedef NullableFutureOrNullableInt = FutureOr<int?>?;

typedef F1 = Never? Function<X extends FutureOr<Object?>>(DoubleNullableInt);
typedef F1_NORM = Null Function<X extends Object?>(int?);
typedef F2 = Null? Function<X extends FutureOr<Null>>([NullableDynamic]);
typedef F2_NORM = Null Function<X extends NullableFutureNull>([dynamic]);
typedef F3 = NullableVoid Function<X extends FutureOr<Object>>(
    {FutureOr<Never> v});
typedef F3_NORM = void Function<X extends Object>({Future<Never> v});

typedef RecordPositionalVoid = (void,);
typedef RecordPositionalNullableVoid = (NullableVoid,);
typedef RecordNamedNullableInt = ({NullableInt n});
typedef RecordNamedDoubleNullableInt = ({DoubleNullableInt n});
typedef RecordDynamicNull = (dynamic, {Null n});
typedef RecordNullableDynamicNullableNever = (
  NullableDynamic, {
  NullableNever n
});

main() {
  // NORM(FutureOr<T>) == S, if NORM(T) == S and S is a top type
  Expect.identical(Void, FutureOr<void>);
  // NORM(FutureOr<T>) == S, if NORM(T) == S and S is a top type
  Expect.identical(dynamic, FutureOr<dynamic>);
  // NORM(FutureOr<T>) == S, if NORM(T) == S and S is a top type
  Expect.identical(NullableObject, FutureOr<Object?>);
  // NORM(FutureOr<T>) == Object, if NORM(T) == Object
  Expect.identical(Object, FutureOr<Object>);
  // NORM(FutureOr<T>) == Future<Never>, if NORM(T) == Never
  Expect.identical(Future<Never>, FutureOr<Never>);
  // NORM(FutureOr<T>) == Future<Null>?, if NORM(T) == Null
  Expect.identical(NullableFutureNull, FutureOr<Null>);
  // NORM(FutureOr<T>) == FutureOr<S>, where NORM(T) == S (all other cases)
  Expect.identical(FutureOr<int?>, FutureOr<DoubleNullableInt>);

  // NORM(T?) == S, if NORM(T) == S and S is a top type
  Expect.identical(dynamic, NullableDynamic);
  // NORM(T?) == S, if NORM(T) == S and S is a top type
  Expect.identical(Void, NullableVoid);
  // NORM(T?) == S, if NORM(T) == S and S is a top type
  Expect.identical(NullableObject, DoubleNullableObject);
  // NORM(T?) == Null, if NORM(T) == Never
  Expect.identical(Null, NullableNever);
  // NORM(T?) == Null, if NORM(T) == Null
  Expect.identical(Null, NullableNull);
  // NORM(T?) == FutureOr<R>, if NORM(T) == FutureOr<R> and R is nullable
  Expect.identical(FutureOr<int?>, NullableFutureOrNullableInt);
  // NORM(T?) == R?, if NORM(T) == R?
  Expect.identical(NullableInt, DoubleNullableInt);
  // NORM(T?) == S?, if NORM(T) == S (all other cases)
  Expect.identical(NullableInt, NullableInt);

  // NORM(C<T0, ..., Tn>) = C<R0, ..., Rn> where Ri is NORM(Ti)
  Expect.identical(Map<void, dynamic>, Map<FutureOr<void>, FutureOr<dynamic>>);
  Expect.identical(
      Map<Object?, Object>, Map<FutureOr<Object?>, FutureOr<Object>>);
  Expect.identical(
      Map<Future<Never>, Future<Null>?>, Map<FutureOr<Never>, FutureOr<Null>>);
  Expect.identical(Map<FutureOr<int?>, dynamic>,
      Map<FutureOr<DoubleNullableInt>, NullableDynamic>);
  Expect.identical(Map<void, Object?>, Map<NullableVoid, DoubleNullableObject>);
  Expect.identical(Map<Null, Null>, Map<NullableNever, NullableNull>);
  Expect.identical(
      Map<FutureOr<int?>, int?>, Map<FutureOr<int?>?, DoubleNullableInt>);
  Expect.identical(Map<F1_NORM, F2_NORM>, Map<F1, F2>);
  Expect.identical(Map<F3_NORM, RecordPositionalVoid>,
      Map<F3, RecordPositionalNullableVoid>);
  Expect.identical(Map<RecordNamedNullableInt, RecordDynamicNull>,
      Map<RecordNamedDoubleNullableInt, RecordNullableDynamicNullableNever>);

  // NORM(R Function<X extends B>(S)) = R1 Function<X extends B1>(S1)
  // where R1 = NORM(R)
  // and B1 = NORM(B)
  // and S1 = NORM(S)
  Expect.identical(F1_NORM, F1);
  Expect.identical(F2_NORM, F2);
  Expect.identical(F3_NORM, F3);

  // NORM((S0, ..., Sn, {T0 d0, ..., Tm dm})) =
  //                (S0', ..., Sn', {T0' d0, ..., Tm' dm})
  // where Si' = NORM(Si)
  // and Ti' = NORM(Ti)
  Expect.identical(RecordPositionalVoid, RecordPositionalNullableVoid);
  Expect.identical(RecordNamedNullableInt, RecordNamedDoubleNullableInt);
  Expect.identical(RecordDynamicNull, RecordNullableDynamicNullableNever);
}
