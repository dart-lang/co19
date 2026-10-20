// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `Never` otherwise
///
/// @description Check that DOWN(`T1`, `T2`) = `Never` if no earlier rule
/// applies. Test mixed kinds: a function type vs a non-function type, a record
/// type vs a non-record type, `Function` vs `Record`, and a type variable vs an
/// unrelated type. The operands are not TOP, OBJECT, NULL, BOTTOM, of the form
/// `T?`, or `FutureOr`, and are not subtypes of each other.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(Function) v1, void Function(int) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2(void Function(Function) v1, void Function(Record) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3(void Function(Record) v1, void Function(String) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4(void Function((int,)) v1, void Function(int) v2) {
  // The record-type cases apply only when both operands are record types.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5(void Function(Rec) v1, void Function(String) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6(void Function(int Function()) v1, void Function(int) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f7(void Function(int Function()) v1, void Function((int,)) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f8<X extends num>(void Function(X) v1, void Function(String) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f9<X extends num>(void Function(X) v1, void Function(int) v2) {
  // `X <: int` is false, and `int <: X` is false.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f10(void Function(Function) v1, void Function(List<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f11(void Function(Future<int>) v1, void Function(int Function()) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f12(void Function(Future<int>) v1, void Function((int,)) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f13(void Function(ET) v1, void Function(Function) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f14(void Function(ET) v1, void Function((int,)) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f15(void Function(FPositional) v1, void Function(int) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f16<X>(void Function(X) v1, void Function(int) v2) {
  // `X <: int` is false, and `int <: X` is false.
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
  f8<int>((x) {}, (x) {});
  f9<num>((x) {}, (x) {});
  f10((x) {}, (x) {});
  f11((x) {}, (x) {});
  f12((x) {}, (x) {});
  f13((x) {}, (x) {});
  f14((x) {}, (x) {});
  f15((x) {}, (x) {});
  f16<num>((x) {}, (x) {});
}
