// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Binary operator: All binary operators other than `==`, `&&`,
/// `||`, and `??` are handled as calls to the appropriate `operator` method.
///
/// @description Checks that for an expression of the form `E1 ^= E2`,
/// `before(E2) = after(E1)`. Test that if `after(E1)` is unreachable then
/// `before(E2)` is also unreachable.
/// @author sgrekhov22@gmail.com
/// @issue 61427

void test<T extends Never>(T n) {
  late int i;
  if (2 > 1) {
    n ^= (i = 42);
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
