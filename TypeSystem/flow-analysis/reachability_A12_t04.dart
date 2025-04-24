// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion instance check If `N` is an expression of the form `E1 is S`
/// where the static type of `E1` is `T` then:
/// - Let `before(E1) = before(N)`
/// - If `T` is a bottom type, then:
///   - Let `true(N) = unreachable(after(E1))`.
///   - Let `false(N) = after(E1)`.
/// - Otherwise:
///   - Let `true(N) = promote(E1, S, after(E1))`
///   - Let `false(N) = promote(E1, factor(T, S), after(E1))`
///
/// @description Checks that for expression of the form `E1 is S`,
/// `true(N) = promote(E1, S, after(E1))` and
/// `false(N) = promote(E1, factor(T, S), after(E1))`. Test `factor(T, S)` for
/// the case `T` is `FutureOr<R>` and `R <: S`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';

class C {}

test(FutureOr<C> foc) async {
  if (foc is C) {
    foc.expectStaticType<Exactly<C>>();
  } else {
    foc.expectStaticType<Exactly<Future<C>>>();
  }
}

main() {
  test(C());
  test(Future<C>.value(C()));
}
