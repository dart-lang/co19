// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for each statement: If `N` is a for statement of the form
/// `for (T X in E) S`, `for (var X in E) S`, or `for (X in E) S`, then:
/// - Let `before(E) = before(N)`
/// - Let `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
/// - Let `after(N) = join(before(S), break(S))`
///
/// @description Checks that
/// `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`. Test
/// that if a variable is captured in `S` then it is detected by the flow
/// analysis.
/// @author sgrekhov22@gmail.com

test1(int? n) {
  if (n != null) { // n promoted to `int`
    for (var i in [42]) {
      late int? x = (n = 42); // n demoted to `int?`
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

test2(int? n) {
  if (n != null) { // n promoted to `int`
    for (var j in [42]) {
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      () {
        n = 42; // n demoted to `int?`
      };
    }
  }
}

main() {
  print(test1);
  print(test2);
}
