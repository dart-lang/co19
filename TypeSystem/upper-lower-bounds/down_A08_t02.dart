// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) where NULL(`T1`) and NULL(`T2`) =
///   - `T1` if MOREBOTTOM(`T1`, `T2`)
///   - `T2` otherwise
///
/// @description Check that DOWN(`T1`, `T2`) = `T2` if `T1 != T2`, `T1` and `T2`
/// are both not a TOP or BOTTOM, NULL(`T1`), NULL(`T2`) and not
/// MOREBOTTOM(`T1`, `T2`).
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

// ignore_for_file: unnecessary_question_mark

void f1(void Function(Never?) v1, void Function(Null) v2) {
  // DOWN(Never?, Null) = Null because MOREBOTTOM(Never?, Null) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f2(void Function(Null?) v1, void Function(Null) v2) {
  // DOWN(Null?, Null) = Null because MOREBOTTOM(Null?, Null) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f3<X extends Never>(void Function(X?) v1, void Function(Null) v2) {
  // DOWN(X?, Null) = Null because MOREBOTTOM(X?, Null) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f4<X extends Never>(void Function(X?) v1, void Function(Null?) v2) {
  // DOWN(X?, Null?) = Null? because MOREBOTTOM(X?, Null?) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f5(void Function(Null?) v1, void Function(Never?) v2) {
  // DOWN(Null?, Never?) = Never? because MOREBOTTOM(Null?, Never?) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never?)>>();
}

void f6<X extends Null, Y extends Never>(void Function(X) v1, void Function(Y) v2) {
  // DOWN(X, Y) = X because MOREBOTTOM(X, Y) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Y)>>();
}

void main() {
  f1((Never? x) {}, (Null x) {});
  f2((Null? x) {}, (Null x) {});
  f3((Never? x) {}, (Null x) {});
  f4((Never? x) {}, (Null? x) {});
  f5((Null? x) {}, (Never? x) {});
  f6((Null x) {}, (Never x) {});
}
