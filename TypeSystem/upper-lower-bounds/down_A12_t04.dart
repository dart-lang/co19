// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) where OBJECT(`T1`) =
///   - `T2` if `T2` is non-nullable
///   - NonNull(`T2`) if NonNull(`T2`) is non-nullable
///   - `Never` otherwise
///
/// @description Check that DOWN(`T1`, `T2`) = `Never` if `T1 != T2`, `T1` and
/// `T2` are neither TOP, BOTTOM, NULL, if OBJECT(`T1`), not OBJECT(`T2`), `T2`
/// is not non-nullable and NonNull(`T2`) is not non-nullable.
/// @author sgrekhov22@gmail.com
/// @issue 52127

import 'dart:async';
import '../../Utils/static_type_helper.dart';

// TODO(sgrekhov): Move tests below to down_A12_t03.dart once issue 52127 is fixed.

void f1a<X>(void Function(Object) v1, void Function(X) v2) {
  // DOWN(Object, X) = Never because is neither X is non-nullable nor NonNull(X) is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f1b<X>(void Function(FutureOr<Object>) v1, void Function(X) v2) {
  // DOWN(FutureOr<Object>, X) = Never because is neither X is non-nullable nor NonNull(X) is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2a<X>(void Function(Object) v1, void Function(X?) v2) {
  // DOWN(Object, X?) = Never because is neither X? is non-nullable nor NonNull(X?) is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2b<X>(
    void Function(FutureOr<Object>) v1,
    void Function(X?) v2,
    ) {
  // DOWN(FutureOr<Object>, X?) = Never because is neither X? is non-nullable nor NonNull(X?) is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void main() {
  f1a((Object x) {}, (num x) {});
  f1b((FutureOr<Object> x) {}, (num x) {});
  f2a((Object x) {}, (x) {});
  f2b((FutureOr<Object> x) {}, (x) {});
}
