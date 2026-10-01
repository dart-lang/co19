// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// - DOWN(`T`, `T`) = `T`
///
/// @description Check that DOWN(`T`, `T`) = `T`. Test types `Object` and
/// `void`.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(Object x) v1, void Function(Object y) v2) {
  var v = (1 > 2) ? v1 : v2;
  // Type of `v` is `UP(void, void) Function(DOWN(Object, Object))`
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    o.expectStaticType<Exactly<Object>>();
    o = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
    if (1 > 2) {
      o.checkNotDynamic;
//      ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  };
}

void f2(void Function(void x) v1, void Function(void y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(void)>>();
  v = (o) {
    print(o); // Type `void` cannot be used.
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

void f3(void Function(Never x) v1, void Function(Never y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
  v = 1; // Rejects `dynamic`
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  f1((Object o) {}, (Object o) {});
  f2((void o) {}, (void o) {});
  f3((Never o) {}, (Never o) {});
}
