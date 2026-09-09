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
/// @description Check that DOWN(`T1`, `T2`) = `T2` if BOTTOM(`T1`),
/// BOTTOM(`T2`), `T1 != T2`, not TOP(`T1`) nor TOP(`T2`), and not
/// MOREBOTTOM(`T1`, `T2`).
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void f1<X extends Never>(void Function(X) v1, void Function(Never) v2) {
  // DOWN(X, Never) = Never because MOREBOTTOM(X, Never) = false
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void main() {
  print(f1);
}
