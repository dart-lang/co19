// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2?`) = `S` where `S` is DOWN(`T1`, `T2`)
///
/// @description Check that DOWN(`T1`, `T2?`) = `S` where `S` is DOWN(`T1`, `T2`)
/// if `T1 != T2?` and the operands are not the same type and none of them is
/// TOP, BOTTOM, NULL, or OBJECT. Test that if `T1` and `T2` are not subtypes of
/// each other then `S` is DOWN(`T1`, `T2`).
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(int) v1, void Function(String?) v2) {
  // DOWN(int, String?) = DOWN(int, String) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2(void Function(C) v1, void Function(String?) v2) {
  // DOWN(C, String?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3(void Function(Function) v1, void Function(Record?) v2) {
  // DOWN(Function, Record?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4(void Function(List<int>) v1, void Function(List<String>?) v2) {
  // DOWN(List<int>, List<String>?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5(void Function(D<int, String>) v1, void Function(D<String, int>?) v2) {
  // DOWN(D<int, String>, D<String, int>?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6(void Function((int,)) v1, void Function((String,)?) v2) {
  // DOWN((int,), (String,)?) = (Never,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((Never,))>>();
}

void f7(void Function((int,)) v1, void Function((int, String)?) v2) {
  // DOWN((int,), (int, String)?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f8(void Function(int Function()) v1, void Function(String Function()?) v2) {
  // DOWN(int Function(), String Function()?) = Never Function()
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never Function())>>();
}

void f9(void Function(int Function(int)) v1, void Function(int Function()?) v2) {
  // DOWN(int Function(int), int Function()?) = int Function([int])
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function([int]))>>();
}

void f10(void Function(FutureOr<int>) v1, void Function(String?) v2) {
  // DOWN(FutureOr<int>, String?) = DOWN(FutureOr<int>, String) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f11(void Function(FutureOr<int>) v1, void Function(FutureOr<String>?) v2) {
  // DOWN(FutureOr<int>, FutureOr<String>?) = FutureOr<Never>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<Never>)>>();
}

void f12<X>(void Function(X) v1, void Function(num?) v2) {
  // DOWN(X, num?) = DOWN(X, num) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f13(void Function(FutureOr<int>) v1, void Function(num?) v2) {
  // DOWN(FutureOr<int>, num?) = DOWN(FutureOr<int>, num) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int)>>();
}

void main() {
  f1((int x) {}, (String? x) {});
  f2((C x) {}, (String? x) {});
  f3((Function x) {}, (Record? x) {});
  f4((List<int> x) {}, (List<String>? x) {});
  f5((D<int, String> x) {}, (D<String, int>? x) {});
  f6(((int,) x) {}, ((String,)? x) {});
  f7(((int,) x) {}, ((int, String)? x) {});
  f8((int Function() x) {}, (String Function()? x) {});
  f9((int Function(int) x) {}, (int Function()? x) {});
  f10((FutureOr<int> x) {}, (String? x) {});
  f11((FutureOr<int> x) {}, (FutureOr<String>? x) {});
  f12<int>((int x) {}, (num? x) {});
  f13((FutureOr<int> x) {}, (num? x) {});
}
