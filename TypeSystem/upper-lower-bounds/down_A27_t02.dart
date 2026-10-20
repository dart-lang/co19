// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`FutureOr<T1>`, `T2`) = `S`
///   where `S` is DOWN(`T1`, `T2`)
///
/// @description Check that DOWN(`FutureOr<T1>`, `T2`) = `S` where `S` is
/// DOWN(`T1`, `T2`) and `S` is `Never`. `T2` is not `Future` or `FutureOr`,
/// neither `FutureOr<T1>` nor `T2` is a subtype of the other, and neither is
/// TOP or OBJECT.
/// Note that `FutureOr<...>` is never BOTTOM, NULL, a type of the form `U?`, a
/// type variable, `Function`, a function type, `Record`, or a record type.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(FutureOr<String>) v1, void Function(int) v2) {
  // DOWN(String, int) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2(void Function(FutureOr<E>) v1, void Function(int) v2) {
  // DOWN(E, int) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3(void Function(FutureOr<()>) v1, void Function(num) v2) {
  // DOWN((), num) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4(void Function(FutureOr<(int,)>) v1, void Function((int, String)) v2) {
  // DOWN of records with different shape is Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5(void Function(FutureOr<Null>) v1, void Function(int) v2) {
  // DOWN(Null, int) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6<X extends num>(void Function(FutureOr<X>) v1, void Function(int) v2) {
  // DOWN(X, int) = Never. `X <: int` is false, so `int` is not a subtype of
  // `FutureOr<X>`.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f7(void Function(FutureOr<C>) v1, void Function(String) v2) {
  // DOWN(C, String) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f8(void Function(FutureOr<List<int?>>) v1, void Function(List<num>) v2) {
  // List<int?> <: List<num> is false, so `List<num>` is not a subtype of
  // `FutureOr<List<int?>>`.
  // DOWN(List<int?>, List<num>) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f9<X>(void Function(FutureOr<X>) v1, void Function(int) v2) {
  // DOWN(X, int) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f10<X>(void Function(FutureOr<X>) v1, void Function(num) v2) {
  // DOWN(X, num) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
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
  f9<num>((x) {}, (x) {});
  f10<num>((x) {}, (x) {});
}
