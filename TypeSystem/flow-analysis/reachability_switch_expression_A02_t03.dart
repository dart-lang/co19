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
/// @description Checks that if `C` is not labelled then `before(S) = after(E)`.
/// Test that if `C` is not labeled and a promoted variable was captured in `E`
/// then it is demoted in `S`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

void test1(int? n) {
  if (n != null) {  // n promoted to int
    var x = switch ((){n = 42;}) { // n demoted to int?
      1 => n.isEven, // ignore: constant_pattern_never_matches_value_type
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => false
    };
  }
}

void test2(int? n) {
  if (n != null) {  // n promoted to int
    var x = switch ((){(n,) = (42,);}) { // n demoted to int?
      1 => n.isEven, // ignore: constant_pattern_never_matches_value_type
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => false
    };
  }
}

void test3(int? n) {
  if (n != null) {  // n promoted to int
    var x = switch ((){(x: n) = (x: 42);}) { // n demoted to int?
      1 => n.isEven, // ignore: constant_pattern_never_matches_value_type
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => false
    };
  }
}

void test4(int? n) {
  if (n != null) {  // n promoted to int
    var x = switch ((){C(v: n) = C(42);}) { // n demoted to int?
      1 => n.isEven, // ignore: constant_pattern_never_matches_value_type
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => false
    };
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
