// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Conditional assignment to a non local-variable: If `N` is an
/// expression of the form `E1 ??= E2` where `E1` is not a local variable, and
/// the type of `E1` is `T1`, then:
/// - Let `before(E1) = before(N)`.
/// - If `T1` is strictly non-nullable, then:
///   - Let `before(E2) = unreachable(after(E1))`.
///   - Let `after(N) = after(E1)`.
/// - Otherwise:
///   - Let before(E2) = split(after(E1)).
///   - Let after(N) = merge(after(E2), split(after(E1))).
///
/// @description Checks that if `E1` is not a local variable and is a subtype
/// of `Null`, then `E2` is always executed.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

class C<T extends Null> {
  T m;
  C(this.m);

  test() {
    int i;
    m ??= (i = 42) as dynamic;
    i; // Definitely assigned
  }
}

main() {
  Expect.throws(() {
    C(null).test();
  });
}
