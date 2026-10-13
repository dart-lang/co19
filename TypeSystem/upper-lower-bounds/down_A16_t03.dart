// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2?`) = `S` where `S` is DOWN(`T1`, `T2`)
///
/// @description Check that DOWN(`T1`, `T2?`) = `S` where `S` is DOWN(`T1`, `T2`)
/// if the operands are not the same type and none of them is TOP, BOTTOM, NULL,
/// or OBJECT. Test that if `T1`or `T2` is a BOTTOM type then that type is `S`
/// accordingly.
/// @author sgrekhov22@gmail.com
/// @issue 64570

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

// TODO(sgrekhov): Move the test below to down_A16_t01.dart once issue 64570 is fixed.

void f1<X extends Null, Y extends Never>(
    void Function(X) v1,
    void Function(Y?) v2,
    ) {
  // DOWN(X, Y?) = DOWN(X, Y) = Y because Y is a BOTTOM type
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Y)>>();
  probeList(paramList(v)).isBottomVar(); // Rejects `void Function(Never)`
}

void main() {
  f1((Null x) {}, (Never? x) {});
}
