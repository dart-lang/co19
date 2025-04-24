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
///
/// @description Checks that if `C` is labelled then
/// `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`. Test
/// that if `C` is labeled and a variable was assigned in `N` then  it is
/// in a "possibly assigned" state in `S`. Test record-pattern assignment.
/// @author sgrekhov22@gmail.com

class C {
  final int v;
  const C(this.v);
}

void test1() {
  late int i;
  switch (42) {
    case 1:
      (i,) = (42,);
    label: case 2:
      i; // Possibly assigned
    default:
  }
}

void test2() {
  late int i;
  switch (42) {
    label: case 1:
      i;
    case 2:
      (x: i) = (x: 42);
    default:
  }
}

void test3() {
  late int i;
  switch (42) {
    label: case 1:
      i;
    default:
      (i,) = (42,);
  }
}

main() {
  test1();
  test2();
  test3();
}
