// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `T2` if TOP(`T1`)
///
/// @description Check that DOWN(`T1`, `T2`) = `T2` if TOP(`T1`) and not
/// TOP(`T2`) (which implies `T1 != T2`). Test `FutureOr<dynamic>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(FutureOr<dynamic>) v1, void Function(num) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f2<X extends num>(
  void Function(FutureOr<dynamic>) v1,
  void Function(X) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f3(void Function(FutureOr<dynamic>) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f4(void Function(FutureOr<dynamic>) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5(void Function(FutureOr<dynamic>) v1, void Function(Function) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f6(void Function(FutureOr<dynamic>) v1, void Function(Record) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f7(void Function(FutureOr<dynamic>) v1, void Function(FutureOr<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f8(void Function(FutureOr<dynamic>) v1, void Function(String?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f9(void Function(FutureOr<dynamic>) v1, void Function(C) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f10(void Function(FutureOr<dynamic>) v1, void Function(D<int, String>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f11(void Function(FutureOr<dynamic>) v1, void Function(FPositional) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f12(void Function(FutureOr<dynamic>) v1, void Function(FNamed) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f13(void Function(FutureOr<dynamic>) v1, void Function(Rec) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f14(void Function(FutureOr<dynamic>) v1, void Function(E) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f15(void Function(FutureOr<dynamic>) v1, void Function(ET) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void f16(
  void Function(FutureOr<dynamic>) v1,
  void Function(Future<Object?>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Object?>)>>();
}

void main() {
  f1((FutureOr<dynamic> x) {}, (num x) {});
  f2((FutureOr<dynamic> x) {}, (num x) {});
  f3((FutureOr<dynamic> x) {}, (Null x) {});
  print(f4);
  f5((FutureOr<dynamic> x) {}, (Function x) {});
  f6((FutureOr<dynamic> x) {}, (Record x) {});
  f7((FutureOr<dynamic> x) {}, (FutureOr<int> x) {});
  f8((FutureOr<dynamic> x) {}, (String? x) {});
  f9((FutureOr<dynamic> x) {}, (C x) {});
  f10((FutureOr<dynamic> x) {}, (D<int, String> x) {});
  f11((FutureOr<dynamic> x) {}, (FPositional x) {});
  f12((FutureOr<dynamic> x) {}, (FNamed x) {});
  f13((FutureOr<dynamic> x) {}, (Rec x) {});
  f14((FutureOr<dynamic> x) {}, (E x) {});
  f15((FutureOr<dynamic> x) {}, (ET x) {});
  f16((FutureOr<dynamic> x) {}, (Future<Object?> x) {});
}
