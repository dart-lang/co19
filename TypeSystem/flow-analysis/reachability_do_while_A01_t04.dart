// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion do while statement: If `N` is a do while statement of the form
/// `do S while (E)` then:
/// - Let `before(S) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`.
/// - Let `before(E) = join(after(S), continue(N))`
/// - Let `after(N) = join(false(E), break(S))`
///
/// @description Checks that if a variable is captured in `S` then it is
/// detected by flow analysis of `E`.
/// @author sgrekhov22@gmail.com

test(int? n) {
  if (n != null) { // promoted to `int`
    do {
      () {
        n = 42; // demoted to `int?`
      };
    } while (n > 0);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(test);
}
