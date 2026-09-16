// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// - DOWN(`T`, `T`) = `T`
///
/// @description Check that DOWN(`T`, `T`) = `T`. Check types `void`,
/// `FutureOr<void>` and `FutureOr<dynamic>`.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(void x) v1, void Function(void y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(void)>>();
  v = (o) {
    print(o); // Type `void` cannot be used.
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

void f2(void Function(FutureOr<void> x) v1, void Function(FutureOr<void> y) v2) {
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

void f3(void Function(FutureOr<dynamic> x) v1, void Function(FutureOr<dynamic> y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<dynamic>)>>();
  v = (o) async {
    // See README.md for an explanation of each step in the checks below.
    o.checkNotDynamic; // Rejects `dynamic` and `Never`
//  ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    (await o).checkDynamic;
    o = 1; // Rejects `FutureOr<Never>`
  };
}

void main() {
  print(f1);
  print(f2);
  print(f3);
}
