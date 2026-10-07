// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `T2` if `T2` <: `T1`
///
/// @description Check that DOWN(`T1`, `T2`) = `T2` if `T2` <: `T1`. Test a type
/// variable, `Function` vs a function type, `Record` vs a record type, and
/// `FutureOr` vs a type.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1<X extends num>(void Function(num) v1, void Function(X) v2) {
  // DOWN(num, X) = X
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f2(void Function(Function) v1, void Function(FPositional) v2) {
  // DOWN(Function, FPositional) = FPositional
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f3(void Function(Function) v1, void Function(int Function()) v2) {
  // DOWN(Function, int Function()) = int Function()
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function())>>();
}

void f4(void Function(Record) v1, void Function(Rec) v2) {
  // DOWN(Record, Rec) = Rec
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f5(void Function(Record) v1, void Function((int,)) v2) {
  // DOWN(Record, (int,)) = (int,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int,))>>();
}

void f6(void Function(FutureOr<num>) v1, void Function(int) v2) {
  // int <: FutureOr<num>, so DOWN(FutureOr<num>, int) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int)>>();
}

void f7(void Function(FutureOr<num>) v1, void Function(FutureOr<int>) v2) {
  // FutureOr<int> <: FutureOr<num>, so DOWN = FutureOr<int>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f8(void Function(Enum) v1, void Function(E) v2) {
  // DOWN(Enum, E) = E
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void main() {
  f1<int>((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3((x) {}, (x) {});
  f4((x) {}, (x) {});
  f5((x) {}, (x) {});
  f6((x) {}, (x) {});
  f7((x) {}, (x) {});
  f8((x) {}, (x) {});
}
