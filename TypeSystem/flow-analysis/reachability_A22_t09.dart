// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Method invocation: If `N` is an expression of the form
/// `E1.m1(E2)`, then:
/// - Let `before(E1) = before(N)`
/// - Let `before(E2) = after(E1)`
/// - Let `T` be the static return type of the invocation
/// - If `T <: Never` then:
///   - Let `after(N) = unreachable(after(E2))`.
/// - Otherwise:
///   - Let `after(N) = after(E2)`.
///
/// @description Checks that for an expression of the form `E1..m1(E2)`
/// `before(E2) = after(E1)`. Test that if `after(E1)` is unreachable then
/// `before(E2)` is also unreachable.
/// @note As of now (March 2025), cascade method invocation is still a TODO item
/// in the flow analysis specification. That's why cascaded invocation tests are
/// covered by this assertion, which does not mention cascades.
/// @author sgrekhov22@gmail.com

class C {
  C(int i);
  void foo(int j) {}
}

void test<T extends Never>(T n) {
  late int i;
  if (2 > 1) {
    C(n)..foo(i = 42);
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
