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
/// @description Checks that `after(N) = break(N)`. Test that if a variable is
/// assigned in all `case`s then it is definitely assigned.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

void test() {
  int i;
  var x = switch (42) {
    1 => i = 1,
    2 => (i,) = (2,),
    3 => (x: i) = (x: 3),
    _ => C(v: i) = C(4)
  };
  i; // Definitely assigned
}

main() {
  print(test);
}
