// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - If-null: If `N` is an if-null expression of the form
/// `E1 ?? E2`, where the type of E1 is T1, then:
/// - Let `before(E1) = before(N)`.
/// - If `T1` is strictly non-nullable, then:
///   - Let `before(E2) = unreachable(after(E1))`.
///   - Let `after(N) = after(E1)`.
/// - Otherwise:
///   - Let `before(E2) = split(after(E1))`.
///   - Let `after(N) = merge(after(E2), split(after(E1)))`.
///
/// @description Checks that if `E1` is non-nullable then `E2` is unreachable.
/// @author sgrekhov22@gmail.com
/// @issue 60114

void test(int x) {
  late int i;
  x ?? (i = 42); // `i` is initialized in dead code
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

int y = 0;

main() {
  late int i;
  y ?? (i = 42);
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified

  print(test);
}
