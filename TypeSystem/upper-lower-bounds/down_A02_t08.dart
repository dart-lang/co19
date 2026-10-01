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
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';

void f1a(void Function(FutureOr<void>) v1, void Function(dynamic) v2) {
  // DOWN(FutureOr<void>, dynamic) = FutureOr<void>
  // because MORETOP(dynamic, FutureOr<void>) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<void>)>>();
  v = (o) async {
    print(o); // Rejects `void`
    print(await o); // Type `void` cannot be used.
    //    ^^^^^^^
    // [analyzer] unspecified
    // [cfe] unspecified
  };
}

void f1b(void Function(dynamic) v1, void Function(FutureOr<void>) v2) {
  // DOWN(dynamic, FutureOr<void>) = FutureOr<void>
  // because MORETOP(FutureOr<void>, dynamic) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<void>)>>();
  v = (o) async {
    print(o); // Rejects `void`
    print(await o); // Type `void` cannot be used.
    //    ^^^^^^^
    // [analyzer] unspecified
    // [cfe] unspecified
  };
}

void f2a(
  void Function(FutureOr<void>) v1,
  void Function(FutureOr<dynamic>) v2,
) {
  // DOWN(FutureOr<void>, FutureOr<dynamic>) = FutureOr<dynamic>
  // because MORETOP(FutureOr<dynamic>, FutureOr<void>) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<dynamic>)>>();
  v = (o) async {
    // See README.md for an explanation of each step in the checks below.
    o.checkNotDynamic; // Rejects `dynamic` and `Never`
    //^^^^^^^^^^^^^^^
    // [analyzer] unspecified
    // [cfe] unspecified
    (await o).checkDynamic;
    o = 1; // Rejects `FutureOr<Never>`
  };
}

void f2b(
  void Function(FutureOr<dynamic>) v1,
  void Function(FutureOr<void>) v2,
) {
  // DOWN(FutureOr<dynamic>, FutureOr<void>) = FutureOr<dynamic>
  // because MORETOP(FutureOr<void>, FutureOr<dynamic>) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<dynamic>)>>();
  v = (o) async {
    // See README.md for an explanation of each step in the checks below.
    o.checkNotDynamic; // Rejects `dynamic` and `Never`
    //^^^^^^^^^^^^^^^
    // [analyzer] unspecified
    // [cfe] unspecified
    (await o).checkDynamic;
    o = 1; // Rejects `FutureOr<Never>`
  };
}

void main() {
  print(f1a);
  print(f1b);
  print(f2a);
  print(f2b);
}
