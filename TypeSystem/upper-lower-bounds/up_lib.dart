// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Auxiliary library for `UP` tests.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/expect.dart';

class _NotEqual {}
class _EqualTo<T> extends _NotEqual {}
class _Type1<T> extends _EqualTo<T> {}
class _Type2<T> extends _EqualTo<T> {}

void getVoid() {}
FutureOr<void> getFutureOrVoid() {}

class C {}

class D<T0, T1> {}

enum E { e0 }
enum E2 { e0 }

extension type ET(int _) {}
extension type ET2(ET _) implements ET {}
extension type ET3(Object _) implements Object {}

typedef FPositional = num Function<X extends num>(X x, [int i]);
typedef FPositional2 = int Function<X extends num>(X x, [num i]);
typedef FNamed = num Function<X extends num>(X x, {int i});
typedef FNamed2 = int Function<X extends num>(X x, {num i});
typedef Rec = (num, Pattern, {bool b});
typedef Rec2 = (int, String, {bool b});
typedef NullableObject = Object?;

num fPositional<X extends num>(X x, [int i = 0]) => x + i;
int fPositional2<X extends num>(X x, [num i = 0]) => (x + i).toInt();
num fNamed<X extends num>(X x, {int i = 0}) => x + i;
int fNamed2<X extends num>(X x, {num i = 0}) => (x + i).toInt();

/// Object and FutureOr< Object > are subtypes of each other, which means that
/// we can't see the difference using `expectStaticType()` function. The
/// following code makes the distinction:
/// ```
/// import 'dart:async';
///
/// void main() {
///   Object o1 = 42;
///   FutureOr<Object> o2 = 42;
///
///   o1 = confirmObjectContext(); // Throws if the static type of `o1` is `FutureOr<Object>`
///   o2 = confirmFutureOrObjectContext(); // Throws if the static type of `o2` is `Object`
/// }
///```
Future<X> confirmObjectContext<X>() {
  // Confirm that `X` is a top type.
  if (<Object?>[] is List<X>) {
    return Future<X>.value(0 as dynamic);
  }
  Expect.fail('The context is not a top type');
  return Future<X>.value(null); // We need to return something
}

/// Object and FutureOr< Object > are subtypes of each other, which means that
/// we can't see the difference using `expectStaticType()` function. The
/// following code makes the distinction:
/// ```
/// import 'dart:async';
///
/// void main() {
///   Object o1 = 42;
///   FutureOr<Object> o2 = 42;
///
///   o1 = confirmObjectContext(); // Throws if the static type of `o1` is `FutureOr<Object>`
///   o2 = confirmFutureOrObjectContext(); // Throws if the static type of `o2` is `Object`
/// }
///```
Future<X> confirmFutureOrObjectContext<X>() {
  // Confirm that `X` is `Object`.
  if (X == Object) {
    return Future<X>.value(0 as dynamic);
  }
  Expect.fail('The context is not `Object`');
  return Future<X>.value(null);
}

/// A helper function used to distinguish between the types `Object?` and
/// `FutureOr<Object?>`.
///
/// Usage:
/// ```
/// void main() {
///   T v = 1 as dynamic; // Prevent immediate promotion of `v`.
///   var v1 = nonNull(v);
///   Object _ = v1; // Compile-time error if `T` is `FutureOr<Object?>`
/// }
/// ```
X nonNull<X>(X? x) => x as X;

/// A helper function used to distinguish between the types `Object` and
/// `FutureOr<Object>` statically.
///
/// - `Object` context imposes no constraints on `X`, so `X` is `dynamic`;
/// - the `FutureOr<Object>` context is decomposed into
///   `Future<X> <: Future<Object>`, which gives `X <: Object`, so `X` is
///   `Object`.
/// The difference between `dynamic` and `Object` can be seen statically.
Future<X> probeFuture<X>() => Future<X>.value(0 as dynamic);

/// A helper function used to distinguish between the types `Object?` and
/// `FutureOr<Object?>` statically.
///
/// - the `Object?` context is decomposed into `FutureOr<X> <: Object`, which
///   gives `X <: Object`, so `X` is `Object`;
/// - the `FutureOr<Object?>` context is decomposed into `X <: Object?`, so `X`
///   is `Object?`.
/// The difference can be seen statically because `FutureOr<Object>` is not a
/// top type, unlike `FutureOr<Object?>`.
///
/// Note that a `dynamic` context imposes no constraints on `X` either, and
/// `FutureOr<dynamic>` and `FutureOr<Object?>` are mutual subtypes, so this
/// probe does not distinguish `dynamic` from `FutureOr<Object?>`. Use
/// [probeFutureOr2] for that.
FutureOr<X> probeFutureOr<X>() => 0 as dynamic;

/// A helper function used to distinguish between the types `FutureOr<Object>`
/// and `FutureOr<FutureOr<Object>>` statically. [probeFuture] cannot do it,
/// because it infers `X` as `Object` in the former case and as
/// `FutureOr<Object>` in the latter, and these two types are mutual subtypes.
///
/// - the `FutureOr<Object>` context is decomposed into
///   `Future<Future<X>> <: Future<Object>`, that is, `Future<X> <: Object`,
///   which imposes no constraints on `X`, so `X` is `dynamic`;
/// - the `FutureOr<FutureOr<Object>>` context is decomposed into
///   `Future<X> <: FutureOr<Object>` and then into `X <: Object`, so `X` is
///   `Object`.
/// The difference between `dynamic` and `Object` can be seen statically.
///
/// In general, a probe with `k` nested `Future`s infers `X` as `Object` if and
/// only if the context type has at least `k` nested `FutureOr`s.
Future<Future<X>> probeFuture2<X>() =>
    Future<Future<X>>.value(Future<X>.value(0 as dynamic));

/// A helper function used to distinguish `FutureOr<Object?>` from both
/// `FutureOr<FutureOr<Object?>>` and `dynamic` statically. Neither
/// [probeFutureOr], which cannot tell `FutureOr<Object?>` from `dynamic`, nor
/// [probeFuture2], which sees no nullability at all, is able to do it.
///
/// - the `FutureOr<Object?>` context is decomposed into
///   `FutureOr<X> <: Object?` and then into `FutureOr<X> <: Object`, which
///   gives `X <: Object`, so `X` is `Object`;
/// - the `FutureOr<FutureOr<Object?>>` context is decomposed into
///   `FutureOr<X> <: FutureOr<Object?>`, which gives `X <: Object?`, so `X` is
///   `Object?`;
/// - the `dynamic` context imposes no constraints on `X`, so `X` is `dynamic`.
///   `FutureOr<Object>` is not a top type, unlike `FutureOr<Object?>` and
///   `FutureOr<dynamic>`, so the difference can be seen statically. The last
///   two contexts, however, produce mutual subtypes, so `checkDynamic` remains
///   the only check that separates `FutureOr<FutureOr<Object?>>` from `dynamic`.
Future<FutureOr<X>> probeFutureOr2<X>() => Future<FutureOr<X>>.value(0 as dynamic);

/// A helper function used to distinguish `void Function(Null)` from
/// `void Function(Never?)` and `void Function(X?)` where `X extends Never`
/// statically.
///
/// `List<Null>` and `List<Never>` are not mutual subtypes, so the difference
/// can be seen statically:
/// ```dart
/// peelParam(v).expectStaticType<Exactly<List<Null>>>();  // `void Function(Null)`
/// peelParam(v).expectStaticType<Exactly<List<Never>>>(); // `void Function(Never?)`
/// ```
/// `void Function(Null?)` produces `Y` = `Null` as well, so it cannot be
/// distinguished from `void Function(Null)`.
List<Y> peelParam<Y>(void Function(Y?) f) => <Y>[];

/// A helper function used to reify the parameter type of `void Function(Y)` as
/// `List<Y>`.
///
/// Unlike [peelParam], the parameter type is not nullable, so `?` is not
/// removed. The parameter is contravariant, so an argument `void Function(P)`
/// is decomposed into `Y <: P`, and `Y` is inferred as `P`:
/// - `void Function(Null)` gives `List<Null>`;
/// - `void Function(Never)` gives `List<Never>`;
/// - `void Function(X)`, where `X extends Never`, gives `List<X>`.
/// `List<Null>` and `List<Never>` are not mutual subtypes, so they can be
/// distinguished with `expectStaticType`. `List<Never>` and `List<X>` are
/// mutual subtypes; use [probeList] to distinguish them:
/// ```dart
/// paramList(v).expectStaticType<Exactly<List<Never>>>(); // `void Function(Never)`
/// probeList(paramList(v)).isNever(); // Compile-time error if `v` is `void Function(X)`
/// ```
List<Y> paramList<Y>(void Function(Y) f) => <Y>[];

/// A helper function used to distinguish `List<Never>` from `List<X>`, where
/// `X extends Never`, statically.
///
/// These types are mutual subtypes, so `expectStaticType` cannot tell them
/// apart. `Y` is inferred as the element type of the argument. The result is a
/// record whose field types are `_Type1<Never>` and `_Type2<Y>`. These types
/// have the same superinterface `_EqualTo<Never>` only if `Y` is `Never`. See
/// [IsNever]:
/// ```dart
/// probeList(v).isNever(); // Compile-time error if `v` is `List<X>`
/// probeList(v).isBottomVar(); // Compile-time error if `v` is `List<Never>`
/// ```
(_Type1<Never>, _Type2<Y>) probeList<Y>(List<Y> l) =>
    (_Type1<Never>(), _Type2<Y>());

/// Declares `isNever()` for the results of [probeList] when `Y` is `Never`.
///
/// `Z` is inferred as the upper bound of the two field types of the record.
/// For two different classes it is the least upper bound of their interfaces,
/// which only contains a generic superinterface if its type arguments are the
/// same in both types. Therefore:
/// - for `(_Type1<Never>, _Type2<Never>)` `Z` is `_EqualTo<Never>`, which
///   satisfies the bound, so `isNever()` can be invoked;
/// - for `(_Type1<Never>, _Type2<X>)`, where `X extends Never`, `Z` is
///   `_NotEqual`, because `_EqualTo<Never>` and `_EqualTo<X>` are different
///   types, even though they are mutual subtypes. The bound is not satisfied,
///   so `isNever()` is not defined.
extension IsNever<Z extends _EqualTo<Object?>> on (Z, Z) {
  void isNever() {}
}

/// Declares `isBottomVar()` for the results of [probeList] when `Y` is a type
/// variable `X extends Never`.
///
/// This extension applies to both `(_Type1<Never>, _Type2<Never>)` and
/// `(_Type1<Never>, _Type2<X>)`, because both field types are subtypes of
/// `_NotEqual`. For `Y` = `Never`, [IsBottomVarFail] is also applicable and
/// more specific, so it hides this method and the invocation is a compile-time
/// error.
extension IsBottomVar on (_NotEqual, _NotEqual) {
  void isBottomVar() {}
}

/// Hides [IsBottomVar.isBottomVar] when [probeList] was applied to
/// `List<Never>`.
///
/// `Z` is inferred as the upper bound of the two field types, the same way as
/// for [IsNever]. For `(_Type1<Never>, _Type2<Never>)` `Z` is `_EqualTo<Never>`,
/// which satisfies the bound, and `(_EqualTo<Never>, _EqualTo<Never>)` is more
/// specific than `(_NotEqual, _NotEqual)`. `isBottomVar` is a setter here, so
/// the invocation is a compile-time error. For `(_Type1<Never>, _Type2<X>)` `Z`
/// is `_NotEqual`, so this extension is not applicable and [IsBottomVar]
/// remains in effect.
extension IsBottomVarFail<Z extends _EqualTo<Never>> on (Z, Z) {
  set isBottomVar(Never _) {}
}
