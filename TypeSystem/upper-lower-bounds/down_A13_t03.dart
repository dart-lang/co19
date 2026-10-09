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

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(void Function(ET) v1, void Function(Object) v2) {
  // `ET` is neither non-nullable (`ET <: Object` is false) nor nullable.
  // NonNull(ET) = ET is not non-nullable, so DOWN(ET, Object) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f1b(void Function(ET) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f1c<T extends ET>(void Function(T) v1, void Function(Object) v2) {
  // `T` is neither non-nullable (`T <: Object` is false) nor nullable.
  // NonNull(T) = T is not non-nullable, so DOWN(T, Object) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f1d<T extends ET>(void Function(T) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2a(void Function(ET?) v1, void Function(Object) v2) {
  // NonNull(ET?) = ET, which is not non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2b(void Function(ET?) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2c<T extends ET?>(void Function(T) v1, void Function(Object) v2) {
  // `T` is neither non-nullable (`T <: Object` is false) nor nullable.
  // NonNull(T) = T is not non-nullable, so DOWN(T, Object) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2d<T extends ET?>(void Function(T) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3a(void Function(FutureOr<ET>) v1, void Function(Object) v2) {
  // `FutureOr<ET>` is neither non-nullable nor nullable.
  // NonNull(FutureOr<ET>) = FutureOr<ET> is not non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3b(void Function(FutureOr<ET>) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4a(void Function(FutureOr<int?>) v1, void Function(Object) v2) {
  // FutureOr<int?> is nullable. NonNull(FutureOr<int?>) = FutureOr<int?>, which
  // is still not non-nullable, so DOWN(FutureOr<int?>, Object) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4b(
  void Function(FutureOr<int?>) v1,
  void Function(FutureOr<Object>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void main() {
  f1a((ET x) {}, (Object x) {});
  f1b((ET x) {}, (FutureOr<Object> x) {});
  f1c((ET x) {}, (Object x) {});
  f1d((ET x) {}, (FutureOr<Object> x) {});
  f2a((ET? x) {}, (Object x) {});
  f2b((ET? x) {}, (FutureOr<Object> x) {});
  f2c((ET? x) {}, (Object x) {});
  f2d((ET? x) {}, (FutureOr<Object> x) {});
  f3a((FutureOr<ET> x) {}, (Object x) {});
  f3b((FutureOr<ET> x) {}, (FutureOr<Object> x) {});
  f4a((FutureOr<int?> x) {}, (Object x) {});
  f4b((FutureOr<int?> x) {}, (FutureOr<Object> x) {});
}
