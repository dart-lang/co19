// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion type cast If `N` is an expression of the form `E1 as S` where the
/// static type of `E1` is `T` then:
/// - Let `before(E1) = before(N)`
/// - Let `after(N) = promote(E1, S, after(E1))`
///
/// @description Checks that `after(N) = promote(E1, S, after(E1))`. Test that
/// after promotion to `Never` `after(N)` became unreachable.
/// @author sgrekhov22@gmail.com

test1(x) {
  late int i;
  if (1 > 2) {
    x as Never;
    i = 42;
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2(x) {
  late int i;
  if (1 > 2) {
    i = 42;
    x as Never;
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test1(42);
}
