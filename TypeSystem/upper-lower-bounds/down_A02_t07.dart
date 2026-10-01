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
/// and TOP(`T2`) and MORETOP(`T2`, `T1`) or `T2` otherwise. Test that `void` is
/// more top type than others, so the lower bound is the other type.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';

void f1(void Function(FutureOr<dynamic>) v1, void Function(void) v2) {
  // DOWN(FutureOr<dynamic>, void) = FutureOr<dynamic>
  // because MORETOP(void, FutureOr<dynamic>) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<dynamic>)>>();
  v = (o) async {
    // See README.md for an explanation of each step in the checks below.
    o.checkNotDynamic; // Rejects `dynamic` and `Never`
//    ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    (await o).checkDynamic;
    o = 1; // Rejects `FutureOr<Never>`
  };
}

void f2(void Function(FutureOr<void>) v1, void Function(void) v2) {
  // DOWN(FutureOr<void>, void) = FutureOr<void>
  // because MORETOP(void, FutureOr<void>) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<void>)>>();
  // Check that the type of argument of the function is `FutureOr<void>`, not `void`
  v = (o) async {
    print(o); // Rejects `void`
    print(await o); // Type `void` cannot be used.
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

void f3(void Function(void) v1, void Function(FutureOr<dynamic>) v2) {
  // DOWN(void, FutureOr<dynamic>) = FutureOr<dynamic>
  // because MORETOP(FutureOr<dynamic>, void) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<dynamic>)>>();
  v = (o) async {
    // See README.md for an explanation of each step in the checks below.
    o.checkNotDynamic; // Rejects `dynamic` and `Never`
//    ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    (await o).checkDynamic;
    o = 1; // Rejects `FutureOr<Never>`
  };
}

void f4(void Function(void) v1, void Function(FutureOr<void>) v2) {
  // DOWN(void, FutureOr<void>) = FutureOr<void>
  // because MORETOP(FutureOr<void>, void) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<void>)>>();
  v = (o) async {
    print(o); // Rejects `void`
    print(await o); // Type `void` cannot be used.
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

void main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
}
