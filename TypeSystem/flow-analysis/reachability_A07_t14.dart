// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks reachability after method invocation. Tests a static
/// method with a non-nullable return type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=sound-flow-analysis

class C {
  static String m1() => "Non-nullable";
}

main() {
  int i;
  if (C.m1() != null) { // ignore: unnecessary_null_comparison
    i = 42;
  }
  i; // Definitely assigned
}
