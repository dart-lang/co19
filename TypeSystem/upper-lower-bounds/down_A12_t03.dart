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

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(void Function(Object) v1, void Function(ET) v2) {
  // `ET` is neither non-nullable (`ET <: Object` is false) nor nullable.
  // NonNull(ET) = ET is not non-nullable, so DOWN(Object, ET) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f1b(void Function(FutureOr<Object>) v1, void Function(ET) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f1c<T extends ET>(void Function(Object) v1, void Function(T) v2) {
  // `T` is neither non-nullable (`T <: Object` is false) nor nullable.
  // NonNull(T) = T is not non-nullable, so DOWN(Object, T) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f1d<T extends ET>(void Function(FutureOr<Object>) v1, void Function(T) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2a(void Function(Object) v1, void Function(ET?) v2) {
  // NonNull(ET?) = ET, which is not non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2b(void Function(FutureOr<Object>) v1, void Function(ET?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2c<T extends ET?>(void Function(Object) v1, void Function(T) v2) {
  // `T` is neither non-nullable (`T <: Object` is false) nor nullable.
  // NonNull(T) = T is not non-nullable, so DOWN(Object, T) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2d<T extends ET?>(void Function(FutureOr<Object>) v1, void Function(T) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3a(void Function(Object) v1, void Function(FutureOr<ET>) v2) {
  // `FutureOr<ET>` is neither non-nullable nor nullable.
  // NonNull(FutureOr<ET>) = FutureOr<ET> is not non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3b(void Function(FutureOr<Object>) v1, void Function(FutureOr<ET>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4a(void Function(Object) v1, void Function(FutureOr<int?>) v2) {
  // FutureOr<int?> is nullable. NonNull(FutureOr<int?>) = FutureOr<int?>, which
  // is still not non-nullable, so DOWN(Object, FutureOr<int?>) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4b(
  void Function(FutureOr<Object>) v1,
  void Function(FutureOr<int?>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void main() {
  f1a((Object x) {}, (ET x) {});
  f1b((FutureOr<Object> x) {}, (ET x) {});
  f1c((Object x) {}, (ET x) {});
  f1d((FutureOr<Object> x) {}, (ET x) {});
  f2a((Object x) {}, (ET? x) {});
  f2b((FutureOr<Object> x) {}, (ET? x) {});
  f2c((Object x) {}, (ET? x) {});
  f2d((FutureOr<Object> x) {}, (ET? x) {});
  f3a((Object x) {}, (FutureOr<ET> x) {});
  f3b((FutureOr<Object> x) {}, (FutureOr<ET> x) {});
  f4a((Object x) {}, (FutureOr<int?> x) {});
  f4b((FutureOr<Object> x) {}, (FutureOr<int?> x) {});
}
