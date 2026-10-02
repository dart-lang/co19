// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) where OBJECT(`T2`) =
///   - `T1` if `T1` is non-nullable
///   - NonNull(`T1`) if NonNull(`T1`) is non-nullable
///   - `Never` otherwise
///
/// @description Check that DOWN(`T1`, `T2`) = `Never` if `T1 != T2`, `T1` and
/// `T2` are neither TOP, BOTTOM, NULL, if OBJECT(`T2`), not OBJECT(`T1`), `T1`
/// is not non-nullable and NonNull(`T1`) is not non-nullable.
/// @author sgrekhov22@gmail.com
/// @issue 52127

import 'dart:async';
import '../../Utils/static_type_helper.dart';

// TODO(sgrekhov): Move tests below to down_A13_t03.dart once issue 52127 is fixed.

void f1a<X>(void Function(X) v1, void Function(Object) v2) {
  // DOWN(X, Object) = Never because is neither X is non-nullable nor NonNull(X) is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f1b<X>(void Function(X) v1, void Function(FutureOr<Object>) v2) {
  // DOWN(X, FutureOr<Object>) = Never because is neither X is non-nullable nor NonNull(X) is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2a<X>(void Function(X?) v1, void Function(Object) v2) {
  // DOWN(X?, Object) = Never because is neither X? is non-nullable nor NonNull(X?) is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2b<X>(
    void Function(X?) v1,
    void Function(FutureOr<Object>) v2,
    ) {
  // DOWN(X?, Object) = Never because is neither X? is non-nullable nor NonNull(X?) is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void main() {
  f1a((num x) {}, (Object x) {});
  f1b((num x) {}, (FutureOr<Object> x) {});
  f2a((x) {}, (Object x) {});
  f2b((x) {}, (FutureOr<Object> x) {});
}
