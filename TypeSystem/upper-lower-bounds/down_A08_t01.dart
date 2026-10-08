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
/// @description Check that DOWN(`T1`, `T2`) = `T1` if `T1 != T2`, NULL(`T1`),
/// NULL(`T2`) and MOREBOTTOM(`T1`, `T2`). Note that a NULL type is never TOP or
/// BOTTOM.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

// ignore_for_file: unnecessary_question_mark

void f1(void Function(Null) v1, void Function(Never?) v2) {
  // DOWN(Null, Never?) = Null because MOREBOTTOM(Null, Never?) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
  // Reject void Function(Never?)
  peelParam(v).expectStaticType<Exactly<List<Null>>>();
}

void f2(void Function(Null) v1, void Function(Null?) v2) {
  // DOWN(Null, Null?) = Null because MOREBOTTOM(Null, Null?) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
  peelParam(v).expectStaticType<Exactly<List<Null>>>();
}

void f3<X extends Never>(void Function(Null) v1, void Function(X?) v2) {
  // DOWN(Null, X?) = Null because MOREBOTTOM(Null, X?) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
  // Reject void Function(Never?) and void Function(X?)
  peelParam(v).expectStaticType<Exactly<List<Null>>>();
}

void f4<X extends Never>(void Function(Null?) v1, void Function(X?) v2) {
  // DOWN(Null?, X?) = Null? because MOREBOTTOM(Null?, X?) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null?)>>();
  // Reject void Function(Never?) and void Function(X?)
  peelParam(v).expectStaticType<Exactly<List<Null>>>();
}

void main() {
  f1((Null x) {}, (Never? x) {});
  f2((Null x) {}, (Null? x) {});
  f3((Null x) {}, (Never? x) {});
  f4((Null? x) {}, (Never? x) {});
}
