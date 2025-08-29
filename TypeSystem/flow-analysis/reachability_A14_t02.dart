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
/// @description Checks that if `x` is non-nullable then `E1` is dead code.
/// @author sgrekhov22@gmail.com
/// @issue 60114

void test(int o) {
  late int i;
  // `i` is initialized in dead code
  o ??= (i = 42); // ignore: dead_null_aware_expression
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
