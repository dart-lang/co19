// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`Null`, `T2`) =
///   - `Null` if `Null <: T2`
///   - `Never` otherwise
///
/// @description Check that DOWN(`Null`, `T2`) = `Null` if `T1 != T2`, `T1` and
/// `T2` are both not a TOP or BOTTOM, not NULL(`T2`) and `Null <: T2`.
/// @author sgrekhov22@gmail.com
/// @issue 64234

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(Null) v1, void Function(num?) v2) {
  // DOWN(Null, num?) = Null because Null <: num?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f2<X extends num>(void Function(Null) v1, void Function(X?) v2) {
  // DOWN(Null, X?) = Null because Null <: X?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f3(void Function(Null) v1, void Function(Function?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f4(void Function(Null) v1, void Function(Record?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f5(void Function(Null) v1, void Function(FutureOr<int>?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f6(void Function(Null) v1, void Function(String?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f7(void Function(Null) v1, void Function(C?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f8(void Function(Null) v1, void Function(D<int, String>?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f9(void Function(Null) v1, void Function(FPositional?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f10(void Function(Null) v1, void Function(FNamed?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f11(void Function(Null) v1, void Function(Rec?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f12(void Function(Null) v1, void Function(E?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f13(void Function(Null) v1, void Function(ET?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f14(void Function(Null) v1, void Function(FutureOr<Null>?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f15(void Function(Null) v1, void Function(FutureOr<Never>?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f16(void Function(Null) v1, void Function(FutureOr<Null>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>(); // Null <: FutureOr<Null>
}

void f17<X>(void Function(Null) v1, void Function(X?) v2) {
  // DOWN(Null, X?) = Null because Null <: X?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void main() {
  f1((Null x) {}, (num? x) {});
  f2((Null x) {}, (num? x) {});
  f3((Null x) {}, (Function? x) {});
  f4((Null x) {}, (Record? x) {});
  f5((Null x) {}, (FutureOr<int>? x) {});
  f6((Null x) {}, (String? x) {});
  f7((Null x) {}, (C? x) {});
  f8((Null x) {}, (D<int, String>? x) {});
  f9((Null x) {}, (FPositional? x) {});
  f10((Null x) {}, (FNamed? x) {});
  f11((Null x) {}, (Rec? x) {});
  f12((Null x) {}, (E? x) {});
  f13((Null x) {}, (ET? x) {});
  f14((Null x) {}, (FutureOr<Null>? x) {});
  f15((Null x) {}, (FutureOr<Never>? x) {});
  f16((Null x) {}, (FutureOr<Null> x) {});
  f17((Null x) {}, (FutureOr<Null> x) {});
}
