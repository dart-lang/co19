// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `FutureOr<T2>`) = `S`
///   where `S` is DOWN(`T1`, `T2`)
///
/// @description Check that DOWN(`T1`, `FutureOr<T2>`) = `S` where `S` is
/// DOWN(`T1`, `T2`) and `S` is `Never`. `T1` is not `Future` or `FutureOr`,
/// neither `T1` nor `FutureOr<T2>` is a subtype of the other, and neither is
/// TOP or OBJECT.
/// Note that `FutureOr<...>` is never BOTTOM, NULL, a type of the form `U?`, a
/// type variable, `Function`, a function type, `Record`, or a record type.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(int) v1, void Function(FutureOr<String>) v2) {
  // DOWN(int, String) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2(void Function(int) v1, void Function(FutureOr<E>) v2) {
  // DOWN(int, E) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3(void Function(num) v1, void Function(FutureOr<()>) v2) {
  // DOWN(num, ()) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4(void Function((int, String)) v1, void Function(FutureOr<(int,)>) v2) {
  // DOWN of records with different shape is Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5(void Function(int) v1, void Function(FutureOr<Null>) v2) {
  // DOWN(int, Null) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6<X extends num>(void Function(int) v1, void Function(FutureOr<X>) v2) {
  // DOWN(int, X) = Never.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f7(void Function(String) v1, void Function(FutureOr<C>) v2) {
  // DOWN(String, C) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f8(void Function(List<num>) v1, void Function(FutureOr<List<int?>>) v2) {
  // List<num> <: List<int?> is false, so `List<num>` is not a subtype of
  // `FutureOr<List<int?>>`.
  // DOWN(List<num>, List<int?>) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f9<X>(void Function(int) v1, void Function(FutureOr<X>) v2) {
  // DOWN(int, X) = Never.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f10<X>(void Function(num) v1, void Function(FutureOr<X>) v2) {
  // DOWN(num, X) = Never
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
