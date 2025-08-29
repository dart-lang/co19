// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion switch expression: If `N` is a switch expression of the form
/// `switch (E) {alternatives}` then:
/// - Let `before(E) = split(before(N))`.
/// - For each case `Cj` in `alternatives` with expression `Ej`, for `j` in
///   `1 .. k`:
///   - Let `before(Ej) = after(E)`.
/// - Let `after(N) = join(after(E1), after(E2), .. after(Ek))`.
/// TODO (sgrekhov): there is no switch expression in the flow analysis spec yet
/// (April 2025). Update the assertion after spec update.
///
/// @description Checks that if `E` has type `Never` then all `alternatives` are
/// unreachable.
/// @author sgrekhov22@gmail.com

Never foo() => throw "Never";

void test1() {
  late int i;
  if (2 > 1) {
    var x = switch (foo()) {
      1 => (i = 42),
      _ => (i = 42) // ignore: unreachable_switch_case
    };
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test2(Never n) {
  late int i;
  if (2 > 1) {
    var x = switch (n) {
      1 => (i = 42),
      _ => (i = 42) // ignore: unreachable_switch_case
    };
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test3<T extends Never>(T n) {
  late int i;
  if (2 > 1) {
    var x = switch (n) {
      1 => (i = 42),
      _ => (i = 42) // ignore: unreachable_switch_case
    };
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
