// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for each statement: If `N` is a for statement of the form
/// `for (T X in E) S`, `for (var X in E) S`, or `for (X in E) S`, then:
/// - Let `before(E) = before(N)`
/// - Let `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
/// - Let `after(N) = join(before(S), break(S))`
///
/// @description Checks that if `E` has type `Never` then an assignment in `X`
/// is unreachable.
/// @author sgrekhov22@gmail.com
/// @issue 60265

Never foo() => throw "Never";

test1() {
  late int i;
  for (i in foo()) {}
  i; // Definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2(Never n) {
  late int i;
  if (2 > 1) {
    for (i in n) {}
  }
  i; // Definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test3<T extends Never>(T n) {
  late int i;
  for (i in n) {}
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
