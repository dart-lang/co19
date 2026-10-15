// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`FutureOr<T1>`, `Future<T2>`) = `Future<S>`
///   where `S` is DOWN(`T1`, `T2`)
///
/// @description Check that DOWN(`FutureOr<T1>`, `Future<T2>`) = `Future<S>`
/// where `S` is DOWN(`T1`, `T2`) and `S` is `Never`. Neither `FutureOr<T1>` nor
/// `Future<T2>` is a subtype of the other, and neither is TOP or OBJECT.
/// Note that `FutureOr<...>` is never BOTTOM, NULL, a type of the form `U?`, a
/// type variable, `Function`, a function type, `Record`, or a record type.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(FutureOr<String>) v1, void Function(Future<int>) v2) {
  // DOWN(String, int) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Never>)>>();
}

void f2(void Function(FutureOr<E>) v1, void Function(Future<int>) v2) {
  // DOWN(E, int) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Never>)>>();
}

void f3(void Function(FutureOr<()>) v1, void Function(Future<num>) v2) {
  // DOWN((), num) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Never>)>>();
}

void f4(
  void Function(FutureOr<(int,)>) v1,
  void Function(Future<(int, String)>) v2,
) {
  // DOWN of records with different shape is Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Never>)>>();
}

void f5(void Function(FutureOr<Null>) v1, void Function(Future<int>) v2) {
  // DOWN(Null, int) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Never>)>>();
}

void f6<X extends num>(
  void Function(FutureOr<X>) v1,
  void Function(Future<int>) v2,
) {
  // DOWN(X, int) = Never.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Never>)>>();
}

void f7(
  void Function(FutureOr<int Function()>) v1,
  void Function(Future<String Function()>) v2,
) {
  // DOWN(int Function(), String Function()) = Never Function()
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Never Function()>)>>();
}

void f8(
  void Function(FutureOr<C>) v1,
  void Function(Future<FutureOr<String>>) v2,
) {
  // DOWN(C, FutureOr<String>) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Never>)>>();
}

void f9(
  void Function(FutureOr<(int, String)>) v1,
  void Function(Future<(String, int)>) v2,
) {
  // Same shape, but neither record is a subtype of the other.
  // DOWN((int, String), (String, int)) = (Never, Never)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<(Never, Never)>)>>();
}

void f10(
  void Function(FutureOr<List<int?>>) v1,
  void Function(Future<List<num>>) v2,
) {
  // List<int?> <: List<num> is false, so `Future<List<num>>` is not a subtype
  // of `FutureOr<List<int?>>`.
  // DOWN(List<int?>, List<num>) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Never>)>>();
}

void f11(
  void Function(FutureOr<int Function<X extends num>(X)>) v1,
  void Function(Future<String Function<X extends num>(X)>) v2,
) {
  // DOWN(int Function<X extends num>(X), String Function<X extends num>(X)) =
  // Never Function<X extends num>(X)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
        Exactly<void Function(Future<Never Function<X extends num>(X)>)>>();
}

void f12<X>(void Function(FutureOr<X>) v1, void Function(Future<int>) v2) {
  // DOWN(X, int) = Never.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Never>)>>();
}

void main() {
  f1((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3((x) {}, (x) {});
  f4((x) {}, (x) {});
  f5((x) {}, (x) {});
  f6<num>((x) {}, (x) {});
  f7((x) {}, (x) {});
  f8((x) {}, (x) {});
  f9((x) {}, (x) {});
  f10((x) {}, (x) {});
  f11((x) {}, (x) {});
  f12<num>((x) {}, (x) {});
}
