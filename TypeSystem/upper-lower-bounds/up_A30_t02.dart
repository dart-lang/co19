// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`(S0, ... Sk, {T0 d0, ..., Tn dn})`,
///      `(S0', ... Sk', {T0' d0, ..., Tn' dn})`) =
///   `(Q0, ...,Qk, {R0, ..., Rn})` if:
///     - `Qi` is UP(`Si`, `Si'`)
///     - `Ri` is UP(`Ti`, `Ti'`)
///
/// @description Check that UP of two record types with the same shape is a
/// record type of that shape where each field type is UP of the corresponding
/// field types. Test `void` fields.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';

void f1((void,) t1, (dynamic,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(void,)>>();
  print(v.$1); // Type `void` cannot be used
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f2((Object?,) t1, (void,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(void,)>>();
  print(v.$1);
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f3((void,) t1, (Never,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(void,)>>();
  print(v.$1);
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f4((Never,) t1, (void,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(void,)>>();
  print(v.$1);
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f5(({void x}) t1, ({dynamic x}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<({void x})>>();
  print(v.x);
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f6(({Object? x}) t1, ({void x}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<({void x})>>();
  print(v.x);
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f7(({void x}) t1, ({Never x}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<({void x})>>();
  print(v.x);
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f8(({Never x}) t1, ({void x}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<({void x})>>();
  print(v.x);
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f9((FutureOr<void>,) t1, (dynamic,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(dynamic,)>>();
  v.$1.proofDynamic;
}

void f10(({dynamic x}) t1, ({FutureOr<void> x}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<({dynamic x})>>();
  v.x.proofDynamic;
}

void main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
  print(f6);
  print(f7);
  print(f8);
  print(f9);
  print(f10);
}
