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
/// @description Check that DOWN(`T1`, `T2`) = `T2` if `T1 != T2` and TOP(`T1`)
/// and TOP(`T2`) and MORETOP(`T2`, `T1`) == `false`. Test that `void` is more
/// top type than others, so the lower bound is the other type.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(void) v1, void Function(dynamic) v2) {
  // DOWN(void, dynamic) = dynamic because MORETOP(dynamic, void) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(dynamic)>>();
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    if (1 > 2) {
      o.checkDynamic;
    }
    o = 1;
  };
}

void f2(void Function(void) v1, void Function(Object?) v2) {
  // DOWN(void, Object?) = Object? because MORETOP(Object?, void) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Object?)>>();
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    o.expectStaticType<Exactly<Object?>>();
    o = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
    o = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
  };
}

void f3(void Function(void) v1, void Function(FutureOr<dynamic>) v2) {
  // DOWN(void, FutureOr<dynamic>) = FutureOr<dynamic>
  // because MORETOP(FutureOr<dynamic>, void) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<dynamic>)>>();
  v = (o) async {
    // See README.md for an explanation of each step in the checks below.
    o.checkNotDynamic;
//    ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    (await o).checkDynamic;
    o = 1;
  };
}

void f4(void Function(void) v1, void Function(FutureOr<Object?>) v2) {
  // DOWN(void, FutureOr<Object?>) = FutureOr<Object?>
  // because MORETOP(FutureOr<Object?>, void) = false
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

void f5(void Function(void) v1, void Function(FutureOr<void>) v2) {
  // DOWN(void, FutureOr<void>) = FutureOr<void>
  // because MORETOP(FutureOr<void>, void) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<void>)>>();
  v = (o) async {
    // See README.md for an explanation of each step in the checks below.
    print(o); // Rejects `void`
    print(await o); // Type `void` cannot be used.
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

void main() {
  f1((void x) {}, (x) {});
  f2((void x) {}, (Object? x) {});
  f3((void x) {}, (FutureOr<dynamic> x) {});
  f4((void x) {}, (FutureOr<Object?> x) {});
  f5((void x) {}, (FutureOr<void> x) {});
}
