// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// - DOWN(`T`, `T`) = `T`
///
/// @description Check that DOWN(`T`, `T`) = `T`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/expect.dart' show Expect;
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(Object x) v1, void Function(Object y) v2) {
  var v = (1 > 2) ? v1 : v2;
  // Type of `v` is `UP(void, void) Function(DOWN(Object, Object))`
  v.expectStaticType<Exactly<void Function(Object)>>();
}

void f2(void Function(dynamic x) v1, void Function(dynamic y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(dynamic)>>();
}

void f3(void Function(void x) v1, void Function(void y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(void)>>();
}

void f4(void Function(Null x) v1, void Function(Null y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f5(void Function(Never x) v1, void Function(Never y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6(void Function(Function x) v1, void Function(Function y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f7(void Function(Record x) v1, void Function(Record y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f8(void Function(FutureOr<int> x) v1, void Function(FutureOr<int> y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f9(void Function(String? x) v1, void Function(String? y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f10(void Function(C x) v1, void Function(C y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f11(
  void Function(D<int, String> x) v1,
  void Function(D<int, String> y) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f12(void Function(FPositional x) v1, void Function(FPositional y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f13(void Function(FNamed x) v1, void Function(FNamed y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f14(void Function(Rec x) v1, void Function(Rec y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f15(void Function(Enum x) v1, void Function(Enum y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Enum)>>();
}

void f16(void Function(E x) v1, void Function(E y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f17(void Function(ET x) v1, void Function(ET y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void main() {
  f1((Object o) {}, (Object o) {});
  f2((o) {}, (o) {});
  f3((void o) {}, (void o) {});
  f4((Null o) {}, (Null o) {});
  f5((Null o) {}, (Null o) {});
  f6((Function o) {}, (Function o) {});
  f7((Record o) {}, (Record o) {});
  f8((FutureOr<int> o) {}, (FutureOr<int> o) {});
  f9((String? o) {}, (String? o) {});
  f10((C o) {}, (C o) {});
  f11((D<int, String> o) {}, (D<int, String> o) {});
  f12((FPositional o) {}, (FPositional o) {});
  f13((FNamed o) {}, (FNamed o) {});
  f14((Rec o) {}, (Rec o) {});
  f15((Enum o) {}, (Enum o) {});
  f16((E o) {}, (E o) {});
  f17((ET o) {}, (ET o) {});
}
