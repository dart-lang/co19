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
/// @description Checks that `before(S) = after(E)`. Test that if a promoted
/// variable was captured in another `C` then  it is not demoted in `S`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

void test1(int? n) {
  if (n != null) {  // n promoted to int
    var x = switch (42) {
      1 => () {n = 42;},
      2 => () {(n,) = (42,);},
      3 => () {(x: n) = (x: 42);},
      4 => () {C(v: n) = C(42);},
      5 => n.isEven,
      _ => null
    };
  }
}

void test2(int? n) {
  if (n != null) {
    var x = switch (42) {
      0 => n.isEven,
      1 => () {n = 42;},
      2 => () {(n,) = (42,);},
      3 => () {(x: n) = (x: 42);},
      4 => () {C(v: n) = C(42);},
      _ => null
    };
  }
}

void test3(int? n) {
  if (n != null) {
    var x = switch (42) {
      0 => n.isEven,
      1 => () {n = 42;},
      2 => () {(n,) = (42,);},
      3 => () {(x: n) = (x: 42);},
      _ => () {C(v: n) = C(42);}
    };
  }
}

void test4(int? n) {
  if (n != null) {
    var x = switch (42) {
      1 => () {n = 42;},
      2 => () {(n,) = (42,);},
      3 => () {(x: n) = (x: 42);},
      4 => () {C(v: n) = C(42);},
      _ => n.isEven
    };
  }
}

main() {
  test1(1);
  test2(2);
  test3(3);
  test4(4);
}
