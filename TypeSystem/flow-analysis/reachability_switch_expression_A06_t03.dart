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
/// (May 2025). Update the assertion after spec update.
///
/// @description Checks that if a variable is initialized in a `when` part of a
/// switch expression case that will definitely match then this variable is
/// definitely assigned.
/// @author sgrekhov22@gmail.com

void test1() {
  int i;
  var x = switch (42) {
    _ when (i = 42) > 0 => 42,
    _ => 0
  };
  i; // Definitely assigned
}

void test2() {
  int i;
  var x = switch (42) {
    _ when (i = 42) > 0 => 42,
    _ => 0
  };
  i; // Definitely assigned
}

main() {
  test1();
  test2();
}
