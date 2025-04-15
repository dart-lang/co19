// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion negated instance check If `N` is an expression of the form
/// `E1 is! S` where the static type of `E1` is `T` then:
/// - Let `before(E1) = before(N)`
/// - If `T` is a bottom type, then:
///   - Let `true(N) = after(E1)`.
///   - Let `false(N) = unreachable(after(E1))`.
/// - Otherwise:
///   - Let `true(N) = promote(E1, factor(T, S), after(E1))`
///   - Let `false(N) = promote(E1, S, after(E1))`
///
/// @description Checks that for expression of the form `E1 is! S`
/// true(N) = promote(E1, factor(T, S), after(E1))` and
/// `false(N) = promote(E1, S, after(E1))`. Test `factor(T, S)` for the case
/// `T` is `R?` and `Null <: S`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

main() {
  int? i = 2 > 1 ? null : 42;
  if (i is! Null) {
    i.expectStaticType<Exactly<int>>();
  } else {
    Null n = i;
  }
}
