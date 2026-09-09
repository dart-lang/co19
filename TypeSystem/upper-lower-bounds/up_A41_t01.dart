// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`C<T0, ..., Tn>`, `C<S0, ..., Sn>`) = `C<R0,..., Rn>` where `Ri` is
///   UP(`Ti`, `Si`)
///
/// @description Check that UP(`C<T0, ..., Tn>`, `C<S0, ..., Sn>`) =
/// `C<R0,..., Rn>` where `Ri` is UP(`Ti`, `Si`).
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(D<int, String> t1, D<num, Object> t2) {
  // UP(D<int, String>, D<num, Object>) = D<num, Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<D<num, Object>>>();
}

void f2(D<num, String> t1, D<int, Object> t2) {
  // UP(D<num, String>, D<int, Object>) = D<num, Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<D<num, Object>>>();
}

void f3(List<E> t1, List<Enum> t2) {
  // UP(List<E>, List<Enum>) = List<Enum>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<List<Enum>>>();
}

void f4(List<ET2> t1, List<ET> t2) {
  // List is invariant, so neither is a subtype; UP → List<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<List<ET>>>();
}

void f5(D<int?, String> t1, D<num, Object?> t2) {
  // UP(D<int?, String>, D<num, Object?>) = D<num?, Object?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<D<num?, Object?>>>();
}

void f6(List<Never> t1, List<int> t2) {
  // List is invariant; UP(List<Never>, List<int>) = List<int>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<List<int>>>();
}

void main() {
  f1(D<int, String>(), D<num, Object>());
  f2(D<num, String>(), D<int, Object>());
  f3(<E>[], <E>[]);
  f4(<ET2>[], <ET>[]);
  f5(D<int?, String>(), D<num, Object?>());
  print(f6);
}
