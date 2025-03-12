// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Conditional statement: If `N` is a conditional statement of the
/// form `if (E) S1 else S2` then:
/// - Let `before(E) = before(N)`.
/// - Let `before(S1) = split(true(E))`.
/// - Let `before(S2) = split(false(E))`.
/// - Let `after(N) = merge(after(S1), after(S2))`.
///
/// @description Checks that if `E` has type `Never` then both `S1` and `S2` are
/// unreachable.
/// @author sgrekhov22@gmail.com

Never foo() => throw "Never";

void test() {
  late int i;
  if (2 > 1) {
    if (foo()) {
      i = 42; // Variable is initialized in a dead code. This leaves it definitely unassigned
    } else {
      i = 0;
    }
  }
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
