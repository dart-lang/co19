// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion instance check If `N` is an expression of the form `E1 is S`
/// where the static type of `E1` is `T` then:
/// - Let `before(E1) = before(N)`
/// - Let `true(N) = promote(E1, S, after(E1))`
/// - Let `false(N) = promote(E1, factor(T, S), after(E1))`
///
/// @description Checks that for expression of the form `E1 is S`
/// `true(N) = promote(E1, S, after(E1))` and
/// `false(N) = promote(E1, factor(T, S), after(E1))`. Test `factor(T, S)` for
/// the case `T` is `FutureOr<R>` and `Future<R> <: S`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

class C {
  void foo() {}
}

test(FutureOr<C> foc) async {
  if (foc is Future<C>) {
  } else {
    foc.foo();
  }
}

main() {
  test(C());
  test(Future<C>.value(C()));
}
