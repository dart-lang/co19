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
/// and TOP(`T2`) and MORETOP(`T2`, `T1`) or `T2` otherwise. Test type
/// `FutureOr<void>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(FutureOr<void>) v1, void Function(dynamic) v2) {
  // DOWN(FutureOr<void>, dynamic) = FutureOr<void>
  // because MORETOP(dynamic, FutureOr<void>) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<void>)>>();
  // v.expectStaticType<Exactly<void Function(dynamic)>>(); also succeeds. Let's
  // check that type `void` cannot be used.
  v = (o) async {
    print(o); // Ok, `FutureOr<void>` can be used
    print(await o);
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

void f2(void Function(FutureOr<void>) v1, void Function(Object?) v2) {
  // DOWN(FutureOr<void>, Object?) = Object?
  // because MORETOP(Object?, FutureOr<void>) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Object?)>>();
  // Check that v is really `Object?` and not, say `FutureOr<Object?>`
  v = (o) {
    var x = nonNull(o);
    Object y = x; // ignore: unused_local_variable
  };
}

void f3(void Function(FutureOr<void>) v1, void Function(FutureOr<dynamic>) v2) {
  // DOWN(FutureOr<void>, FutureOr<dynamic>) = FutureOr<dynamic>
  // because MORETOP(FutureOr<dynamic>, FutureOr<void>) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<dynamic>)>>();
  v = (o) async {
    o.checkNotDynamic;
//    ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    (await o).checkDynamic;
  };
}

void f4(
  void Function(FutureOr<void>) v1,
  void Function(FutureOr<Object?>) v2,
) {
  // DOWN(FutureOr<void>, FutureOr<Object?>) = FutureOr<Object?>
  // because MORETOP(FutureOr<Object?>, FutureOr<void>) = false
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
  f1((FutureOr<void> x) {}, (x) {});
  f2((FutureOr<void> x) {}, (Object? x) {});
  f3((FutureOr<void> x) {}, (FutureOr<dynamic> x) {});
  f4((FutureOr<void> x) {}, (FutureOr<Object?> x) {});
}
