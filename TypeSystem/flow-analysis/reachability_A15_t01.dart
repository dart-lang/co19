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
/// @description Checks that if `E1` is not a local variable and is strictly
/// non-nullable, then `before(E2) = unreachable(after(E1))`.
/// @author sgrekhov22@gmail.com

class C {
  int m = 0;
  test() {
    int i;
    m ??= (i = 42);
    i; // Definitely unassigned
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

int n = 0;

main() {
  int i;
  n ??= (i = 42);
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
  print(C);
}
