// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) = `T1` if TOP(`T1`)
///
/// @description Check that UP(`T1`, `T2`) = `T1` if TOP(`T1`) and
/// TOP(`T2`) == `false` (which implies `T1 != T2`). Test `FutureOr<dynamic>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(FutureOr<dynamic> d, num n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f2<X extends num>(FutureOr<dynamic> d, X n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f3(FutureOr<dynamic> d) async {
  var v = (1 > 2) ? d : null;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f4(FutureOr<dynamic> d, Never n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f5(FutureOr<dynamic> d, Function n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f6(FutureOr<dynamic> d, Record n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f7(FutureOr<dynamic> d, FutureOr<int> n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f8(FutureOr<dynamic> d, String? n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f9(FutureOr<dynamic> d, C n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f10(FutureOr<dynamic> d, D<int, String> n)  async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f11(FutureOr<dynamic> d, FPositional n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f12(FutureOr<dynamic> d, FNamed n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f13(FutureOr<dynamic> d, Rec n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f14(FutureOr<dynamic> d, E n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f15(FutureOr<dynamic> d, ET n) async {
  var v = (1 > 2) ? d : n;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f16(FutureOr<dynamic> d, Future<Object?> n) async {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void main() {
  f1('1', 2);
  f2('2', 2);
  f3('3');
  print(f4);
  f5('5', () {});
  f6('6', (1,));
  f7('7', 7);
  f8('8', '8');
  f9('9', C());
  f10('10', D<int, String>());
  f11('11', <X extends num>(X x, [int i = 0]) => 0);
  f12('12', <X extends num>(X x, {int i = 0}) => 0);
  f13('13', (1, 'two', b: true));
  f14('14', E.e0);
  f15('15', ET(0));
  f16('16', Future.value(42));
}
