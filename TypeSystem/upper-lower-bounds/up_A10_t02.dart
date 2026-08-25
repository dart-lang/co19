// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where NULL(`T1`) and NULL(`T2`) =
///   - `T2` if MOREBOTTOM(`T1`, `T2`)
///   - `T1` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T1` if `T1 != T2`, `T1` and `T2`
/// are both not a TOP, BOTTOM, or intersection type, if NULL(`T1`), NULL(`T2`)
/// and not MOREBOTTOM(`T1`, `T2`).
/// @author sgrekhov22@gmail.com
/// @issue 63908

import '../../Utils/static_type_helper.dart';

// ignore_for_file: unused_local_variable, unnecessary_question_mark

void f1(Never? n) {
  var v = (1 > 2) ? n : null;
  // UP(Never?, Null) = Never?, because MOREBOTTOM(T, Null) = false
  // It's not possible to check that `v` is `Never?`. Let's check that it is
  // assignable to both `String` and `int` and is not `dynamic`
  if (v == null) {
    return; // Never? is not assignable to `int` or `String`. Let's strip `?`.
  }
  int i = v;
  String s = v;
  // If `v` has type `dynamic` then `v2` will have type `dynamic` as well. It
  // has type `Object?` if `v` has any non-top type (including the bottom type
  // that we expect it to have).
  var v2 = (1 > 2) ? v : 42 as Object?;
  v2.proofNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f2(Null? n) {
  // In the case var v = (1 > 2) ? n : null; the inferred type of `v` is
  // `dynamic` for historical reasons. Though MOREBOTTOM(Null?, Null) = false
  // and the expression should has type `Null`.
  ((1 > 2) ? n : null).expectStaticType<Exactly<Null>>();
}

void f3<X extends Never>(X? n) {
  var v = (1 > 2) ? n : null;
  // UP(X?, Null) = X?, because MOREBOTTOM(X?, Null) = false
  v.expectStaticType<Exactly<X?>>();
  // Let's check that `v` is not assignable to a non-nullable variable (that
  // proofs that `v` is not `dynamic`).
  int x = v;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f4<X extends Never>(X? n1, Null? n2) {
  var v = (1 > 2) ? n1 : n2;
  // UP(X?, Null) = X?, because MOREBOTTOM(X?, Null?) = false
  v.expectStaticType<Exactly<X?>>();
  // Let's check that `v` is not assignable to a non-nullable variable (that
  // proofs that `v` is not `dynamic`).
  int x = v;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f5(Null? n1, Never? n2) {
  // UP(Null?, Never?) = Null?, because MOREBOTTOM(Null?, Never?) = false
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<Null>>();
  // Let's check that `v` is not assignable to a non-nullable variable (that
  // proofs that `v` is not `dynamic`.
  int x = v;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
}
