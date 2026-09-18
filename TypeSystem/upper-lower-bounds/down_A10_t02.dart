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
/// @description Check that DOWN(`T1`, `Null`) = `Never` if `T1 != T2`, `T1` and
/// `T2` are both not a TOP or BOTTOM, not NULL(`T1`) and not `Null <: T1`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(num) v1, void Function(Null) v2) {
  // DOWN(num, Null) = Never because Null <: num is false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2<X extends num>(void Function(X) v1, void Function(Null) v2) {
  // DOWN(X, Null) = Never because Null <: X is false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3(void Function(Function) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4(void Function(Record) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5(void Function(FutureOr<int>) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6(void Function(C) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f7(void Function(D<int, String>) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f8(void Function(FPositional) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f9(void Function(FNamed) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f10(void Function(Rec) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f11(void Function(E) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f12(void Function(ET) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f13(void Function(Object) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f14(void Function(FutureOr<Never>) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f15<X>(void Function(X) v1, void Function(Null) v2) {
  // DOWN(X, Null) = Never because Null <: X is false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void main() {
  f1((num x) {}, (Null x) {});
  f2((num x) {}, (Null x) {});
  f3((Function x) {}, (Null x) {});
  f4((Record x) {}, (Null x) {});
  f5((FutureOr<int> x) {}, (Null x) {});
  f6((C x) {}, (Null x) {});
  f7((D<int, String> x) {}, (Null x) {});
  f8((FPositional x) {}, (Null x) {});
  f9((FNamed x) {}, (Null x) {});
  f10((Rec x) {}, (Null x) {});
  f11((E x) {}, (Null x) {});
  f12((ET x) {}, (Null x) {});
  f13((Object x) {}, (Null x) {});
  f14((FutureOr<Never> x) {}, (Null x) {});
  f15<num>((num x) {}, (Null x) {});
}
