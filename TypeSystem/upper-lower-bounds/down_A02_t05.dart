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
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(Object?) v1, void Function(dynamic) v2) {
  // DOWN(Object?, dynamic) = Object? because MORETOP(dynamic, Object?) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Object?)>>();
  // Check that v is really `Object?` and not, say `FutureOr<Object?>`
  v = (o) {
    var x = nonNull(o);
    Object y = x; // ignore: unused_local_variable
    o.checkNotDynamic;
//    ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

void f2(void Function(Object?) v1, void Function(FutureOr<dynamic>) v2) {
  // DOWN(Object?, FutureOr<dynamic>) = Object?
  // because MORETOP(FutureOr<dynamic>, Object?) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Object?)>>();
  v = (o) async {
    var x = nonNull(o);
    Object y = x; // ignore: unused_local_variable
    o.checkNotDynamic;
//    ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    (await o).checkNotFutureOrDynamic;
//            ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

void f3(void Function(FutureOr<Object?>) v1, void Function(dynamic) v2) {
  // DOWN(FutureOr<Object?>, dynamic) = FutureOr<Object?>
  // because MORETOP(dynamic, FutureOr<Object?>) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<Object?>)>>();
  v = (o) {
    var x = nonNull(o);
    Object y = x; // ignore: unused_local_variable
//             ^
// [analyzer] unspecified
// [cfe] unspecified
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
    var x = nonNull(o);
    Object y = x; // ignore: unused_local_variable
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

void main() {
  f1((Object? x) {}, (x) {});
  f2((Object? x) {}, (FutureOr<dynamic> x) {});
  f3((FutureOr<Object?> x) {}, (x) {});
  f4((FutureOr<Object?> x) {}, (FutureOr<dynamic> x) {});
}
