// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Auxiliary library for `UP` tests.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/expect.dart';

void getVoid() {}
FutureOr<void> getFutureOrVoid() {}

class C {}

class D<T0, T1> {}

enum E { e0 }
enum E2 { e0 }

extension type ET(int _) {}
extension type ET2(ET _) implements ET {}

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
