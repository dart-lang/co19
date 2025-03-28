// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for each statement: If `N` is a for statement of the form
/// `for (T X in E) S`, `for (var X in E) S`, or `for (X in E) S`, then:
/// - Let `before(E) = before(N)`
/// - Let `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
/// - Let `after(N) = join(before(S), break(S))`
///
/// @description Checks that if `X` has type `Never` then an assignment in `S`
/// is unreachable.
/// @author sgrekhov22@gmail.com
/// @issue 60394

test1() {
  late int i;
  if (2 > 1) {
    for (Never n in <dynamic>[42]) {
      i = 42;
    }
  }
  i; // Possibly assigned. See https://github.com/dart-lang/sdk/issues/60394
}

test2(Never n) {
  late int i;
  if (2 > 1) {
    for (n in <dynamic>[42]) {
      i = 42;
    }
  }
  i; // Definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test3<T extends Never>(T n) {
  late int i;
  if (2 > 1) {
    for (n in <dynamic>[42]) {
      i = 42;
    }
  }
  i; // Definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
