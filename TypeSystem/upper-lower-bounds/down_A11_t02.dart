// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) where OBJECT(`T1`) and OBJECT(`T2`) =
///   - `T1` if MORETOP(`T2`, `T1`)
///   - `T2` otherwise
///
/// @description Check that DOWN(`T1`, `T2`) = `T2` if `T1 != T2` and
/// OBJECT(`T1`) and OBJECT(`T2`) and not MORETOP(`T2`, `T1`). Test that `Object`
/// is more top than `FutureOr<Object>`, so the lower bound is the less top type.
/// Note that none of TOP(`T`), BOTTOM(`T`), or NULL(`T`) holds when OBJECT(`T`),
/// and `T` is not an intersection type.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(Object) v1, void Function(FutureOr<Object>) v2) {
  // DOWN(Object, FutureOr<Object>) = FutureOr<Object>
  // because MORETOP(FutureOr<Object>, Object) = false
  var v = (1 > 2) ? v1 : v2;
  // Check that static type of `o` is really `FutureOr<Object>`, neither
  // `Object` nor `FutureOr<FutureOr<Object>>`.
  v.expectStaticType<Exactly<void Function(FutureOr<Object>)>>();
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    o.expectStaticType<Exactly<Object>>();
    o = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
    o = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  };
}

void f2(void Function(Object) v1, void Function(FutureOr<FutureOr<Object>>) v2) {
  // DOWN(Object, FutureOr<FutureOr<Object>>) = FutureOr<FutureOr<Object>>
  // because MORETOP(FutureOr<FutureOr<Object>>, Object) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<FutureOr<Object>>)>>();
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    o.expectStaticType<Exactly<Object>>();
    o = probeFuture()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
    o = probeFuture2()..expectStaticType<Exactly<Future<Future<Object>>>>();
  };
}

void f3(
  void Function(FutureOr<Object>) v1,
  void Function(FutureOr<FutureOr<Object>>) v2,
) {
  // DOWN(FutureOr<Object>, FutureOr<FutureOr<Object>>) =
  // FutureOr<FutureOr<Object>> because
  // MORETOP(FutureOr<FutureOr<Object>>, FutureOr<Object>) =
  // MORETOP(FutureOr<Object>, Object) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<FutureOr<Object>>)>>();
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    o.expectStaticType<Exactly<Object>>();
    o = probeFuture()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
    o = probeFuture2()..expectStaticType<Exactly<Future<Future<Object>>>>();
  };
}

void main() {
  f1((Object x) {}, (FutureOr<Object> x) {});
  f2((Object x) {}, (FutureOr<FutureOr<Object>> x) {});
  f3((FutureOr<Object> x) {}, (FutureOr<FutureOr<Object>> x) {});
}
