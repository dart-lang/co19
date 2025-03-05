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
/// @description Checks that if in the expression of the form `E1..m1(E2)` the
/// return type of `m1(...)` is `Never` then `after(N) = unreachable(after(E2))`
/// @note As of now (March 2025), cascade method invocation is still a TODO item
/// in the flow analysis specification. That's why cascaded invocation tests are
/// covered by this assertion, which does not mention cascades.
/// @author sgrekhov22@gmail.com

class C<T extends Never> {
  T foo() => throw "";
  Future<T> bar() async {
    throw "";
  }
}

void test1() {
  late int i;
  if (2 > 1) {
    C()..foo();
    i = 42;
  }
  i; // Definitely unassigned
  //^
  // [analyzer] unspecified
  // [cfe] unspecified
}

void test2() {
  late int i;
  if (2 > 1) {
    C()..bar(); // Return type is not `Never`
    i = 42;
  }
  i; // Not definitely unassigned
}

void test3() async {
  late int i;
  if (2 > 1) {
    await C()  // This should be parsed as (await C())
      ..bar(); // Return type is not `Never`
    i = 42;
  }
  i; // Not definitely unassigned
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
