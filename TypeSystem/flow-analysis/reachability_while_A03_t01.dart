// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion while statement: If `N` is a while statement of the form
/// `while (E) S` then:
/// - Let `before(E) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(E))`.
/// - Let `after(N) = inheritTested(join(false(E), unsplit(break(S))), after(S))`
///
/// @description Checks that if `E` is a boolean `true` literal and there is no
/// reachable `break` in `S` then `after(N) is unreachable.
/// @author sgrekhov22@gmail.com

test1() {
  late int i;
  if (1 > 2) {
    while (true) {
      if (false) {
        break;
      }
    }
    i = 42; // Initialization in dead code
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  late int i;
  if (1 > 2) {
    while (true) {
      if (false) {
        return;
      }
    }
    i = 42;
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test3() {
  late int i;
  if (1 > 2) {
    while (true) {
      return;
    }
    i = 42;
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
}
