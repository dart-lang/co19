// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `Null`) =
///   - `Null` if `Null <: T1`
///   - `Never` otherwise
///
/// @description Check that DOWN(`T1`, `Null`) = `Null` if `T1 != T2`, `T1` and
/// `T2` are both not a TOP or BOTTOM, not NULL(`T1`) and `Null <: T1`.
/// @author sgrekhov22@gmail.com
/// @issue 64234

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(num?) v1, void Function(Null) v2) {
  // DOWN(num?, Null) = Null because Null <: num?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f2<X extends num>(void Function(X?) v1, void Function(Null) v2) {
  // DOWN(X?, Null) = Null because Null <: X?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f3(void Function(Function?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f4(void Function(Record?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f5(void Function(FutureOr<int>?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f6(void Function(String?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f7(void Function(C?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f8(void Function(D<int, String>?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f9(void Function(FPositional?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f10(void Function(FNamed?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f11(void Function(Rec?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f12(void Function(E?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f13(void Function(ET?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f14(void Function(FutureOr<Null>?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f15(void Function(FutureOr<Never>?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f16(void Function(FutureOr<Null>) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>(); // Null <: FutureOr<Null>
}

void f17<X>(void Function(X?) v1, void Function(Null) v2) {
  // DOWN(X?, Null) = Null because Null <: X?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void main() {
  f1((num? x) {}, (Null x) {});
  f2((num? x) {}, (Null x) {});
  f3((Function? x) {}, (Null x) {});
  f4((Record? x) {}, (Null x) {});
  f5((FutureOr<int>? x) {}, (Null x) {});
  f6((String? x) {}, (Null x) {});
  f7((C? x) {}, (Null x) {});
  f8((D<int, String>? x) {}, (Null x) {});
  f9((FPositional? x) {}, (Null x) {});
  f10((FNamed? x) {}, (Null x) {});
  f11((Rec? x) {}, (Null x) {});
  f12((E? x) {}, (Null x) {});
  f13((ET? x) {}, (Null x) {});
  f14((FutureOr<Null>? x) {}, (Null x) {});
  f15((FutureOr<Never>? x) {}, (Null x) {});
  f16((FutureOr<Null> x) {}, (Null x) {});
  f17<num>((num? x) {}, (Null x) {});
}
