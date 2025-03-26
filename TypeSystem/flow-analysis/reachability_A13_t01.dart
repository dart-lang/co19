// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion type cast If `N` is an expression of the form `E1 as S` where the
/// static type of `E1` is `T` then:
/// - Let `before(E1) = before(N)`
/// - Let `after(N) = promote(E1, S, after(E1))`
///
/// @description Checks that `after(N) = promote(E1, S, after(E1))`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

main() {
  int? i = 2 > 1 ? 42 : null;
  i as int;
  i.expectStaticType<Exactly<int>>();
}
