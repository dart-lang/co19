// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`(...)`, `(...)`) = `Never` otherwise
///
/// @description Check that DOWN(`(...)`, `(...)`) = `Never` if the records do
/// not have the same shape (different number of positional fields, different
/// names of named fields, etc.).
/// Note that no earlier rule applies because record types are never TOP, OBJECT,
/// NULL, BOTTOM, types of the form `T?`, type variables, function types, or
/// `Function`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(()) v1, void Function((dynamic,)) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2(void Function((void,)) v1, void Function((void, String)) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3(
  void Function((Object?, String)) v1,
  void Function((Object?, String, bool)) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4(void Function((Never,)) v1, void Function(({int i})) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5(void Function(({dynamic i})) v1, void Function(({dynamic j})) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6(void Function(({void i})) v1, void Function(({void i, String s})) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f7(
  void Function((Function, {String s})) v1,
  void Function((Function, String)) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f8(
  void Function((E, {String s})) v1,
  void Function(({E i, String s})) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f9(void Function((ET, {String a})) v1, void Function((ET, {String b})) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f10(
  void Function((Null, {String s})) v1,
  void Function((Null, {String s, bool b})) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f11(void Function(Rec) v1, void Function((int, String)) v2) {
  // Rec = (num, Pattern, {bool b})
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f12(void Function((Object?, (String,))) v1, void Function((Object?,)) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f13<X extends num>(void Function((X,)) v1, void Function((X, String)) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f14(void Function((Never, {int i})) v1, void Function(({int i})) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f15(void Function((Function,)) v1, void Function((Function, int)) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f16(void Function((E,)) v1, void Function((E, String)) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f17(void Function((ET,)) v1, void Function(({ET x})) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f18(void Function((Null,)) v1, void Function(()) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f19(
  void Function((FutureOr<int>,)) v1,
  void Function((FutureOr<int>, String)) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f20(
  void Function((void, {Function x})) v1,
  void Function((void, {E y})) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f21(
  void Function((dynamic, {ET x})) v1,
  void Function((dynamic, {ET y})) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void main() {
  f1((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3((x) {}, (x) {});
  f4((x) {}, (x) {});
  f5((x) {}, (x) {});
  f6((x) {}, (x) {});
  f7((x) {}, (x) {});
  f8((x) {}, (x) {});
  f9((x) {}, (x) {});
  f10((x) {}, (x) {});
  f11((x) {}, (x) {});
  f12((x) {}, (x) {});
  f13<int>((x) {}, (x) {});
  f14((x) {}, (x) {});
  f15((x) {}, (x) {});
  f16((x) {}, (x) {});
  f17((x) {}, (x) {});
  f18((x) {}, (x) {});
  f19((x) {}, (x) {});
  f20((x) {}, (x) {});
  f21((x) {}, (x) {});
}
