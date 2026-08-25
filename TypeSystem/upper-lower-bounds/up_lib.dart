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

typedef FPositional = int Function<X extends num>(X s, [int i]);
typedef FNamed = int Function<X extends num>(X s, {int i});
typedef Rec = (int, String, {bool b});

/// Object and FutureOr< Object > are subtypes of each other, which means that
/// we can't see the difference using `expectStaticType()` function. The
/// following code makes the distinction:
/// ```
/// import 'dart:async';
///
/// Future<X> f<X>() {
///   print(X);
///   return Future<Never>.error(0);
/// }
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
/// Future<X> f<X>() {
///   print(X);
///   return Future<Never>.error(0);
/// }
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
extension type ET2(ET _) implements ET {}

typedef FPositional = num Function<X extends num>(X x, [int i]);
typedef FPositional2 = int Function<X extends num>(X x, [num i]);
typedef FNamed = num Function<X extends num>(X x, {int i});
typedef FNamed2 = int Function<X extends num>(X x, {num i});
typedef Rec = (num, Pattern, {bool b});
typedef Rec2 = (int, String, {bool b});

num fPositional<X extends num>(X x, [int i = 0]) => x + i;
int fPositional2<X extends num>(X x, [num i = 0]) => (x + i).toInt();
num fNamed<X extends num>(X x, {int i = 0}) => x + i;
int fNamed2<X extends num>(X x, {num i = 0}) => (x + i).toInt();
