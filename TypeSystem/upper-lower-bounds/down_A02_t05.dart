// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) where TOP(`T1`) and TOP(`T2`) =
///   - `T1` if MORETOP(`T2`, `T1`)
///   - `T2` otherwise
///
/// @description Check that DOWN(`T1`, `T2`) = `T1` if `T1 != T2` and TOP(`T1`)
/// and TOP(`T2`) and MORETOP(`T2`, `T1`). Test that `dynamic` is more top than
/// `Object?`, so the lower bound is `Object?`.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(Object?) v1, void Function(dynamic) v2) {
  // DOWN(Object?, dynamic) = Object? because MORETOP(dynamic, Object?) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Object?)>>();
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    o.expectStaticType<Exactly<Object?>>();
    o = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
    o = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
  };
}

void f2(void Function(Object?) v1, void Function(FutureOr<dynamic>) v2) {
  // DOWN(Object?, FutureOr<dynamic>) = Object?
  // because MORETOP(FutureOr<dynamic>, Object?) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Object?)>>();
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    o.expectStaticType<Exactly<Object?>>();
    o = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
    o = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
  };
}

void f3(void Function(FutureOr<Object?>) v1, void Function(dynamic) v2) {
  // DOWN(FutureOr<Object?>, dynamic) = FutureOr<Object?>
  // because MORETOP(dynamic, FutureOr<Object?>) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<Object?>)>>();
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    o.expectStaticType<Exactly<Object?>>();
    o = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
    o = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
    o = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
  };
}

void f4(
  void Function(FutureOr<Object?>) v1,
  void Function(FutureOr<dynamic>) v2,
) {
  // DOWN(FutureOr<Object?>, FutureOr<dynamic>) = FutureOr<Object?>
  // because MORETOP(FutureOr<dynamic>, FutureOr<Object?>) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<Object?>)>>();
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    o.expectStaticType<Exactly<Object?>>();
    o = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
    o = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
    o = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
  };
}

void main() {
  f1((Object? x) {}, (x) {});
  f2((Object? x) {}, (FutureOr<dynamic> x) {});
  f3((FutureOr<Object?> x) {}, (x) {});
  f4((FutureOr<Object?> x) {}, (FutureOr<dynamic> x) {});
}
