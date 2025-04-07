// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion switch statement: If `N` is a switch statement of the form
/// `switch (E) {alternatives}` then:
/// - Let `before(E) = before(N)`.
/// - For each `C` in `alternatives` with statement body `S`:
///   - If `C` is labelled let
///     `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
///     otherwise let `before(S) = after(E)`.
///  - If the cases are exhaustive, then let `after(N) = break(N)` otherwise let
///    `after(N) = join(after(E), break(N))`.
/// TODO (sgrekhov): there is no switch expressions in the flow analysis spec
/// yet (April 2025). Update the assertion after spec update.
///
/// @description Checks that `before(S) = after(E)`. Test that if a variable was
/// assigned in `E` then it is definitely assigned in `S`.
/// @author sgrekhov22@gmail.com
/// @issue 56338

class C {
  int v;
  C(this.v);
}

void test1() {
  int i;
  var x = switch (i = 42) {
    1 => i, // Definitely assigned
    _ => 42
  };
}

void test2() {
  int i;
  var x = switch ((i,) = (42,)) {
    1 => i, // ignore: constant_pattern_never_matches_value_type
    _ => 42
  };
}

void test3() {
  int i;
  var x = switch ((x: i) = (x: 42)) {
    1 => i, // ignore: constant_pattern_never_matches_value_type
    _ => 42
  };
}

void test4() {
  int i;
  var x = switch (C(v: i) = C(42)) {
    1 => i, // ignore: constant_pattern_never_matches_value_type
    _ => 42
  };
}

main() {
  test1();
  test2();
  test3();
  test4();
}
