// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Method invocation: If `N` is an expression of the form
/// `E1.m1(E2)`, then:
///  - Let `before(E1) = before(N)`
///  - Let `before(E2) = after(E1)`
///  - Let `T` be the static return type of the invocation
///  - If `T <: Never` then:
///   - Let `after(N) = unreachable(after(E2))`.
///  - Otherwise:
///    - Let `after(N) = after(E2)`
///
/// @description Checks reachability after method call. Test return type
/// `T <: Null`
/// @author sgrekhov@unipro.ru
/// @issue 41985

class C {
  Null m1() => null;
}

main() {
  C c = new C();
  int i;
  if (c.m1() == null) {
    i = 42;   // condition is always true therefore `i` must be definitely assigned
  }
  i; // It's not an error to read local non-nullable variable if it is definitely assigned
}
