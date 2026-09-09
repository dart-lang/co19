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
/// and TOP(`T2`) and MORETOP(`T2`, `T1`) == false. Test that `dynamic` is more
/// top than `Object?`, so the lower bound is `Object?`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(dynamic) v1, void Function(Object?) v2) {
  // DOWN(dynamic, Object?) = Object? because MORETOP(Object?, dynamic) = false
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

void f2(void Function(FutureOr<dynamic>) v1, void Function(Object?) v2) {
  // DOWN(FutureOr<dynamic>, Object?) = Object?
  // because MORETOP(Object?, FutureOr<dynamic>) = false
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

void f3(void Function(dynamic) v1, void Function(FutureOr<Object?>) v2) {
  // DOWN(dynamic, FutureOr<Object?>) = FutureOr<Object?>
  // because MORETOP(FutureOr<Object?>, dynamic) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<Object?>)>>();
  v = (o) async {
    // Now check that `o` is really `FutureOr<Object?>` not, say, `Object?`.
    // Object? and FutureOr<Object?> cannot be distinguished using `expectStaticType`.

    // Confirm TOP type
    o.expectStaticTOP();

    // Check that `o`'s type is not of the form `T?`.
    var x1 = nonNull(o);
    x1.expectStaticTOP();

    // Check that `o`'s type is of the form `FutureOr<T?>` where `OBJECT(T)`.
    var x2 = await o;
    var x3 = nonNull(x2);
    x3.expectStaticOBJECT();

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

void f4(
  void Function(FutureOr<dynamic>) v1,
  void Function(FutureOr<Object?>) v2,
) {
  // DOWN(FutureOr<dynamic>, FutureOr<Object?>) = FutureOr<Object?>
  // because MORETOP(FutureOr<Object?>, FutureOr<dynamic>) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<Object?>)>>();
  v = (o) async {
    // Now check that `o` is really `FutureOr<Object?>` not, say, `Object?`.
    // Object? and FutureOr<Object?> cannot be distinguished using `expectStaticType`.

    // Confirm TOP type
    o.expectStaticTOP();

    // Check that `o`'s type is not of the form `T?`.
    var x1 = nonNull(o);
    x1.expectStaticTOP();

    // Check that `o`'s type is of the form `FutureOr<T?>` where `OBJECT(T)`.
    var x2 = await o;
    var x3 = nonNull(x2);
    x3.expectStaticOBJECT();

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

void main() {
  f1((x) {}, (Object? x) {});
  f2((FutureOr<dynamic> x) {}, (Object? x) {});
  f3((x) {}, (FutureOr<Object?> x) {});
  f4((FutureOr<dynamic> x) {}, (FutureOr<Object?> x) {});
}
