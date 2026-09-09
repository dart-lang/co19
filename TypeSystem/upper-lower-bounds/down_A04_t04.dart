// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `T1` if TOP(`T2`)
///
/// @description Check that DOWN(`T1`, `T2`) = `T1` if TOP(`T2`) and not
/// TOP(`T1`) (which implies `T1 != T2`). Test `FutureOr<dynamic>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(num) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f2<X extends num>(
  void Function(X) v1,
  void Function(FutureOr<dynamic>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f3(void Function(Null) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f4(void Function(Never) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5(void Function(Function) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f6(void Function(Record) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f7(void Function(FutureOr<int>) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f8(void Function(String?) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f9(void Function(C) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f10(void Function(D<int, String>) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f11(void Function(FPositional) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f12(void Function(FNamed) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f13(void Function(Rec) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f14(void Function(E) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f15(void Function(ET) v1, void Function(FutureOr<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void f16(
  void Function(Future<Object?>) v1,
  void Function(FutureOr<dynamic>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Object?>)>>();
}

void main() {
  f1((num x) {}, (FutureOr<dynamic> x) {});
  f2((num x) {}, (FutureOr<dynamic> x) {});
  f3((Null x) {}, (FutureOr<dynamic> x) {});
  print(f4);
  f5((Function x) {}, (FutureOr<dynamic> x) {});
  f6((Record x) {}, (FutureOr<dynamic> x) {});
  f7((FutureOr<int> x) {}, (FutureOr<dynamic> x) {});
  f8((String? x) {}, (FutureOr<dynamic> x) {});
  f9((C x) {}, (FutureOr<dynamic> x) {});
  f10((D<int, String> x) {}, (FutureOr<dynamic> x) {});
  f11((FPositional x) {}, (FutureOr<dynamic> x) {});
  f12((FNamed x) {}, (FutureOr<dynamic> x) {});
  f13((Rec x) {}, (FutureOr<dynamic> x) {});
  f14((E x) {}, (FutureOr<dynamic> x) {});
  f15((ET x) {}, (FutureOr<dynamic> x) {});
  f16((Future<Object?> x) {}, (FutureOr<dynamic> x) {});
}
