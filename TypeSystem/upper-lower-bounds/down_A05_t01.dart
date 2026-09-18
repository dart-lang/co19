// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) where BOTTOM(`T1`) and BOTTOM(`T2`) =
///   - `T1` if MOREBOTTOM(`T1`, `T2`)
///   - `T2` otherwise
///
/// @description Check that DOWN(`T1`, `T2`) = `T1` if BOTTOM(`T1`),
/// BOTTOM(`T2`), `T1 != T2`, not TOP(`T1`), not TOP(`T2`), and
/// MOREBOTTOM(`T1`, `T2`).
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void f1<X extends Never>(void Function(Never) v1, void Function(X) v2) {
  // DOWN(Never, X) = Never because MOREBOTTOM(Never, X) = true
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void main() {
  f1((Never _) {}, (_) {});
}
