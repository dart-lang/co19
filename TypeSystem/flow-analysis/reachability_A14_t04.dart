// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Local variable conditional assignment: If `N` is an expression
/// of the form `x ??= E1` where `x` is a local variable, then:
/// - Let `before(E1) = split(promote(x, Null, before(N)))`.
/// - Let `M1 = assign(x, E1, after(E1))`
/// - Let `M2 = split(promoteToNonNull(x, before(N)))`
/// - Let `after(N) = merge(M1, M2)`
///
/// @description Checks that if `x` is an equivalent to `Null` then `E1` is
/// always executed.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

void test<T extends Null>(T n) {
  int i;
  n ??= (i = 42) as dynamic;
  i; // Definitely assigned
}

main() {
  Expect.throws(() {
    test(null);
  });
}
